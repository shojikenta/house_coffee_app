require 'rails_helper'

RSpec.describe "Drinks", type: :system do
  let!(:user) { create(:user) }
  let!(:drink) { create(:drink, :picture, user: user) }

  describe "コーヒーレシピ登録ページ" do
    before do
      login_for_system(user)
      visit new_drink_path
    end

    context "ページレイアウト" do
      it "「コーヒーレシピ登録」の文字列が存在すること" do
        expect(page).to have_content 'コーヒーレシピ登録'
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('コーヒーレシピ登録')
      end

      it "入力部分に適切なラベルが表示されること" do
        expect(page).to have_content 'コーヒー名'
        expect(page).to have_content '説明'
        expect(page).to have_content '分量 [人分]'
        expect(page).to have_content 'コツ・ポイント'
        expect(page).to have_content '作り方参考用URL'
        expect(page).to have_content '所要時間 [分]'
        expect(page).to have_content '作り方メモ'
      end
    end

    context "コーヒーレシピ登録処理" do
      it "有効な情報でコーヒーレシピ登録を行うと登録成功のフラッシュが表示されること" do
        fill_in "コーヒー名", with: "ダルゴナコーヒー"
        fill_in "説明", with: "ダルゴナコーヒーの作り方です"
        fill_in "分量", with: 1.5
        fill_in "コツ・ポイント", with: "泡立て器を使うのがおすすめです！"
        fill_in "作り方参考用URL", with: "https://cookpad.com/recipe/6092953"
        fill_in "所要時間", with: 15
        attach_file "drink[picture]", "#{Rails.root}/spec/fixtures/test.jpg"
        click_button "登録する"
        expect(page).to have_content "コーヒーレシピが登録されました！"
      end

      it "画像無しで登録すると、デフォルト画像が割り当てられること" do
        fill_in "コーヒー名", with: "ダルゴナコーヒー"
        click_button "登録する"
        expect(page).to have_link(href: drink_path(Drink.first))
      end

      it "無効な情報でコーヒー登録を行うと登録失敗のフラッシュが表示されること" do
        fill_in "コーヒー名", with: ""
        fill_in "説明", with: "ダルゴナコーヒーの作り方です"
        fill_in "分量", with: 1.5
        fill_in "コツ・ポイント", with: "泡立て器を使うのがおすすめです！"
        fill_in "作り方参考用URL", with: "https://cookpad.com/recipe/6092953"
        fill_in "所要時間", with: 15
        click_button "登録する"
        expect(page).to have_content "コーヒー名を入力してください"
      end
    end
  end

  describe "コーヒーレシピ詳細ページ" do
    context "ページレイアウト" do
      before do
        login_for_system(user)
        visit drink_path(drink)
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title("#{drink.name}")
      end

      it "コーヒーレシピ情報が表示されること" do
        expect(page).to have_content drink.name
        expect(page).to have_content drink.description
        expect(page).to have_content drink.portion
        expect(page).to have_content drink.tips
        expect(page).to have_content drink.reference
        expect(page).to have_content drink.required_time
        expect(page).to have_content drink.made_memo
        expect(page).to have_link nil, href: drink_path(drink), class: 'drink-picture'
      end
    end

    context "コーヒーレシピの削除", js: true do
      it "削除成功のフラッシュが表示されること" do
        login_for_system(user)
        visit drink_path(drink)
        within find('.change-drink') do
          click_on '削除'
        end
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'コーヒーレシピが削除されました'
      end
    end
  end

  describe "コーヒーレシピ編集ページ" do
    before do
      login_for_system(user)
      visit drink_path(drink)
      click_link "編集"
    end

    context "ページレイアウト" do
      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('コーヒーレシピ情報の編集')
      end

      it "入力部分に適切なラベルが表示されること" do
        expect(page).to have_content 'コーヒー名'
        expect(page).to have_content '説明'
        expect(page).to have_content '分量 [人分]'
        expect(page).to have_content 'コツ・ポイント'
        expect(page).to have_content '作り方参考用URL'
        expect(page).to have_content '所要時間 [分]'
        expect(page).to have_content '作り方メモ'
      end
    end

    context "コーヒーレシピの更新処理" do
      it "有効な更新" do
        fill_in "コーヒー名", with: "ダルゴナコーヒー"
        fill_in "説明", with: "ダルゴナコーヒーの作り方です"
        fill_in "分量", with: 1.5
        fill_in "コツ・ポイント", with: "泡立て器を使うのがおすすめです！"
        fill_in "作り方参考用URL", with: "henshu-https://cookpad.com/recipe/6092953"
        fill_in "所要時間", with: 15
        attach_file "drink[picture]", "#{Rails.root}/spec/fixtures/test_2.jpg"
        click_button "更新する"
        expect(page).to have_content "コーヒーレシピ情報が更新されました！"
        expect(drink.reload.name).to eq "ダルゴナコーヒー"
        expect(drink.reload.description).to eq "ダルゴナコーヒーの作り方です"
        expect(drink.reload.portion).to eq 1.5
        expect(drink.reload.tips).to eq "泡立て器を使うのがおすすめです！"
        expect(drink.reload.reference).to eq "henshu-https://cookpad.com/recipe/6092953"
        expect(drink.reload.required_time).to eq 15
        expect(drink.reload.picture.url).to include "test_2.jpg"
      end

      it "無効な更新" do
        fill_in "コーヒー名", with: ""
        click_button "更新する"
        expect(page).to have_content 'コーヒー名を入力してください'
        expect(drink.reload.name).not_to eq ""
      end
    end

    context "コーヒーレシピの削除処理", js: true do
      it "削除成功のフラッシュが表示されること" do
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'コーヒーレシピが削除されました'
      end
    end
  end
end
