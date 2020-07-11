require "rails_helper"

RSpec.describe "コーヒーレシピ一覧ページ", type: :request do
  let!(:user) { create(:user) }
  let!(:drink) { create(:drink, user: user) }

  context "ログインしているユーザーの場合" do
    it "レスポンスが正常に表示されること" do
      login_for_request(user)
      get drinks_path
      expect(response).to have_http_status "200"
      expect(response).to render_template('drinks/index')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get drinks_path
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end
end
