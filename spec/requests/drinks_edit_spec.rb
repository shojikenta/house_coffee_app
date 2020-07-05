require "rails_helper"

RSpec.describe "コーヒーレシピ編集", type: :request do
  let!(:user) { create(:user) }
  let!(:drink) { create(:drink, user: user) }
  let(:picture2_path) { File.join(Rails.root, 'spec/fixtures/test_2.jpg') }
  let(:picture2) { Rack::Test::UploadedFile.new(picture2_path) }
  let!(:other_user) { create(:user) }

  context "認可されたユーザーの場合" do
    it "レスポンスが正常に表示されること(+フレンドリーフォワーディング)" do
      get edit_drink_path(drink)
      login_for_request(user)
      expect(response).to redirect_to edit_drink_url(drink)
      patch drink_path(drink), params: { drink: { name: "ダルゴナコーヒー",
                                                  description: "話題のダルゴナコーヒーを作ろう！",
                                                  portion: 1.5,
                                                  tips: "泡立て器を使うのがおすすめです！",
                                                  reference: "https://cookpad.com/recipe/6092953",
                                                  required_time: 15,
                                                  made_memo: "コップの中で混ぜるよりも、ボウルの中で混ぜる方をお勧めします！",
                                                  picture: picture2 } }
      redirect_to drink
      follow_redirect!
      expect(response).to render_template('drinks/show')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      # 編集
      get edit_drink_path(drink)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
      # 更新
      patch drink_path(drink), params: { drink: { name: "ダルゴナコーヒー",
                                                  description: "話題のダルゴナコーヒーを作ろう！",
                                                  portion: 1.5,
                                                  tips: "泡立て器を使うのがおすすめです！",
                                                  reference: "https://cookpad.com/recipe/6092953",
                                                  required_time: 15,
                                                  made_memo: "コップの中で混ぜるよりも、ボウルの中で混ぜる方をお勧めします！" } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end

  context "別アカウントのユーザーの場合" do
    it "ホーム画面にリダイレクトすること" do
      # 編集
      login_for_request(other_user)
      get edit_drink_path(drink)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
      # 更新
      patch drink_path(drink), params: { drink: { name: "ダルゴナコーヒー",
                                                  description: "話題のダルゴナコーヒーを作ろう！",
                                                  portion: 1.5,
                                                  tips: "泡立て器を使うのがおすすめです！",
                                                  reference: "https://cookpad.com/recipe/6092953",
                                                  required_time: 15,
                                                  made_memo: "コップの中で混ぜるよりも、ボウルの中で混ぜる方をお勧めします！" } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end
  end
end
