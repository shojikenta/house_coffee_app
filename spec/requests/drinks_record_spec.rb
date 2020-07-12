require "rails_helper"

RSpec.describe "コーヒーレシピ登録", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:drink) { create(:drink, user: user) }
  let(:picture_path) { File.join(Rails.root, 'spec/fixtures/test.jpg') }
  let(:picture) { Rack::Test::UploadedFile.new(picture_path) }

  context "ログインしているユーザーの場合" do
    before do
      get new_drink_path
      login_for_request(user)
    end

    context "フレンドリーフォワーディング" do
      it "レスポンスが正常に表示されること" do
        expect(response).to redirect_to new_drink_url
      end
    end

    it "有効なコーヒーデータで登録できること" do
      expect {
        post drinks_path, params: { drink: { name: "ダルゴナコーヒー",
                                             description: "話題のダルゴナコーヒーを作ろう！",
                                             portion: 1.5,
                                             tips: "泡立て器を使うのがおすすめです！",
                                             reference: "https://cookpad.com/recipe/6092953",
                                             required_time: 15,
                                             made_memo: "コップの中で混ぜるよりも、ボウルの中で混ぜる方をお勧めします！",
                                             picture: picture } }
      }.to change(Drink, :count).by(1)
      follow_redirect!
      expect(response).to render_template('drinks/show')
    end

    it "無効なコーヒーデータでは登録できないこと" do
      expect {
        post drinks_path, params: { drink: { name: "",
                                             description: "話題のダルゴナコーヒーを作ろう！",
                                             portion: 1.5,
                                             tips: "泡立て器を使うのがおすすめです！",
                                             reference: "https://cookpad.com/recipe/6092953",
                                             required_time: 15,
                                             made_memo: "コップの中で混ぜるよりも、ボウルの中で混ぜる方をお勧めします！",
                                             picture: picture } }
      }.not_to change(Drink, :count)
      expect(response).to render_template('drinks/new')
    end

    context "必要なモノ有りのコーヒーレシピ登録" do
      it "有効なレシピデータで登録できること" do
        expect {
          post drinks_path, params: { drink: { name: "話題のダルゴナコーヒーを作ろう！",
                                               description: "冬に食べたくなる、身体が温まるコーヒーレシピです",
                                               portion: 1.5,
                                               tips: "泡立て器を使うのがおすすめです！",
                                               reference: "https://cookpad.com/recipe/6092953",
                                               required_time: 15,
                                               picture: picture,
                                               items_attributes: [
                                                 name: "コーヒー粉",
                                                 remarks: "90g"] } }
        }.to change(Drink, :count).by(1)
        redirect_to Drink.first
        follow_redirect!
        expect(response).to render_template('drinks/show')
      end

      it "必要なモノのデータも同時に増えること" do
        expect {
          post drinks_path, params: { drink: { name: "話題のダルゴナコーヒーを作ろう！",
                                               items_attributes: [
                                                 name: "コーヒー粉",
                                                 remarks: "90g"] } }
        }.to change(Item, :count).by(1)
      end

      it "無効なコーヒーレシピデータでは登録できないこと" do
        expect {
          post drinks_path, params: { drink: { name: "",
                                               description: "冬に食べたくなる、身体が温まるコーヒーレシピです",
                                               portion: 1.5,
                                               tips: "泡立て器を使うのがおすすめです！",
                                               reference: "https://cookpad.com/recipe/6092953",
                                               required_time: 15,
                                               picture: picture,
                                               items_attributes: [
                                                 name: "コーヒー粉",
                                                 remarks: "90g"] } }
        }.not_to change(Drink, :count)
        expect(response).to render_template('drinks/new')
      end
    end

    context "必要なモノ無しのコーヒーレシピ登録" do
      it "正常に完了すること" do
        expect {
          post drinks_path, params: { drink: { name: "話題のダルゴナコーヒーを作ろう！" } }
        }.to change(Drink, :count).by(1)
      end

      it "必要なモノのデータは増えないこと" do
        expect {
          post drinks_path, params: { drink: { name: "話題のダルゴナコーヒーを作ろう！" } }
        }.not_to change(Item, :count)
      end
    end
  end
end
