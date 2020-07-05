FactoryBot.define do
  factory :favorite do
    association :drink
    association :user
  end
end
