FactoryBot.define do
  factory :item do
    name { "ケトル" }
    remarks { "1つ" }
    association :drink
  end
end
