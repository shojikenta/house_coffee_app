FactoryBot.define do
  factory :comment do
    user_id { 1 }
    content { "簡単でいいですね" }
    association :drink
  end
end
