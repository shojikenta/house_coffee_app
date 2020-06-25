User.create!(name:  "山田 太郎",
            email: "sample@example.com",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: true)

99.times do |n|
 name  = Faker::Name.name
 email = "sample-#{n+1}@example.com"
 password = "password"
 User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password)
end

10.times do |n|
  Drink.create!(name: Faker::Coffee.blend_name,
               description: "話題のダルゴナコーヒーを作ろう！",
               portion: 1.5,
               tips: "泡立て器を使うのがおすすめです！",
               reference: "https://cookpad.com/recipe/6092953",
               required_time: 15,
               made_memo: "泡立て器で混ぜる方が簡単です",
               user_id: 1)
end
