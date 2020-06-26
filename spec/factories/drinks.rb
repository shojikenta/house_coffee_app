FactoryBot.define do
  factory :drink do
    name { Faker::Coffee.blend_name }
    description { "ダルゴナコーヒーの作り方です" }
    portion { 1.5 }
    tips { "泡だてすぎにご注意！" }
    reference { "https://delishkitchen.tv/recipes/294453041623467066" }
    required_time { 15 }
    made_memo { "泡立て器で混ぜる方が簡単です" }
    association :user
    created_at { Time.current }
  end

  trait :yesterday do
    created_at { 1.day.ago }
  end

  trait :one_week_ago do
    created_at { 1.week.ago }
  end

  trait :one_month_ago do
    created_at { 1.month.ago }
  end

  trait :picture do
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end
end
