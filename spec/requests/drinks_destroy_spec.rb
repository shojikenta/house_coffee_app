require "rails_helper"

RSpec.describe "コーヒーレシピの削除", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:drink) { create(:drink, user: user) }

  context "ログインしていて、自分のレシピを削除する場合" do
    it "処理が成功し、トップページにリダイレクトすること" do
      login_for_request(user)
      expect {
        delete drink_path(drink)
      }.to change(Drink, :count).by(-1)
      redirect_to user_path(user)
      follow_redirect!
      expect(response).to render_template('static_pages/home')
    end
  end

  context "ログインしていて、他人のレシピを削除する場合" do
    it "処理が失敗し、トップページへリダイレクトすること" do
      login_for_request(other_user)
      expect {
        delete drink_path(drink)
      }.not_to change(Drink, :count)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end
  end

  context "ログインしていない場合" do
    it "ログインページへリダイレクトすること" do
      expect {
        delete drink_path(drink)
      }.not_to change(Drink, :count)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end
end
