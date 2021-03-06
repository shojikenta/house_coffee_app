RSpec.describe "StaticPages", type: :system do
  describe "トップページ" do
    context "ページ全体" do
      before do
        visit root_path
      end

      it "House Coffeeの文字列が存在することを確認" do
        expect(page).to have_content 'House Coffee'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title
      end

      context "コーヒーフィード", js: true do
        let!(:user) { create(:user) }
        let!(:drink) { create(:drink, user: user) }

        before do
          login_for_system(user)
        end

        it "みんなのコーヒーのぺージネーションが表示されること" do
          login_for_system(user)
          create_list(:drink, 6, user: user)
          visit root_path
          expect(page).to have_content "みんなのコーヒー (#{user.drinks.count})"
          expect(page).to have_css "div.pagination"
          Drink.take(5).each do |d|
            expect(page).to have_link d.name
          end
        end

        it "「新しいコーヒーをシェアする」リンクが表示されること" do
          visit root_path
          expect(page).to have_link "新しいコーヒーをシェアする", href: new_drink_path
        end
      end
    end
  end

  describe "ヘルプページ" do
    before do
      visit about_path
    end

    it "House Coffeeとは？の文字列が存在することを確認" do
      expect(page).to have_content 'House Coffeeとは？'
    end

    it "正しいタイトルが表示されることを確認" do
      expect(page).to have_title full_title('House Coffeeとは？')
    end
  end

  describe "利用規約ページ" do
    before do
      visit use_of_terms_path
    end

    it "利用規約の文字列が存在することを確認" do
      expect(page).to have_content '利用規約'
    end

    it "正しいタイトルが表示されることを確認" do
      expect(page).to have_title full_title('利用規約')
    end
  end
end
