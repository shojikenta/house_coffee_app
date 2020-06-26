require "rails_helper"

RSpec.describe "コーヒーレシピ登録", type: :request do
  let!(:user) { create(:user) }
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
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get new_drink_path
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end
end
