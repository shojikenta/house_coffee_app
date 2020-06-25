require 'rails_helper'

RSpec.describe Drink, type: :model do
  let!(:drink_yesterday) { create(:drink, :yesterday) }
  let!(:drink_one_week_ago) { create(:drink, :one_week_ago) }
  let!(:drink_one_month_ago) { create(:drink, :one_month_ago) }
  let!(:drink) { create(:drink) }

  context "バリデーション" do
    it "有効な状態であること" do
      expect(drink).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      drink = build(:drink, name: nil)
      drink.valid?
      expect(drink.errors[:name]).to include("を入力してください")
    end

    it "名前が30文字以内であること" do
      drink = build(:drink, name: "あ" * 31)
      drink.valid?
      expect(drink.errors[:name]).to include("は30文字以内で入力してください")
    end

    it "説明が140文字以内であること" do
      drink = build(:drink, description: "あ" * 141)
      drink.valid?
      expect(drink.errors[:description]).to include("は140文字以内で入力してください")
    end

    it "コツ・ポイントが50文字以内であること" do
      drink = build(:drink, tips: "あ" * 51)
      drink.valid?
      expect(drink.errors[:tips]).to include("は50文字以内で入力してください")
    end

    it "メモが200文字以内であること" do
      drink = build(:drink, made_memo: "あ" * 201)
      drink.valid?
      expect(drink.errors[:made_memo]).to include("は200文字以内で入力してください")
    end

    it "ユーザーIDがなければ無効な状態であること" do
      drink = build(:drink, user_id: nil)
      drink.valid?
      expect(drink.errors[:user_id]).to include("を入力してください")
    end
  end

  context "並び順" do
    it "最も最近の投稿が最初の投稿になっていること" do
      expect(drink).to eq Drink.first
    end
  end
end
