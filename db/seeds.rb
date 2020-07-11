# ユーザー
User.create!(
  [
    {
      name:  "山田 一郎",
      email: "sample@example.com",
      password:              "foobar",
      password_confirmation: "foobar",
      admin: true,
    },
    {
      name:  "田中 次郎",
      email: "suzuki@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "採用 三郎",
      email: "recruit@example.com",
      password:              "password",
      password_confirmation: "password",
    },
  ]
)

# フォロー関係
user1 = User.find(1)
user2 = User.find(2)
user3 = User.find(3)
user3.follow(user1)
user3.follow(user2)

# コーヒーレシピ内容
portion = 1
description1 = "本格的なドリップコーヒー"
description2 = "豆乳に変えてみました"
description3 = "甘さを抑えたコーヒー"
tips1 = "蒸らすのを忘れずに！"
tips2 = "濃いめのコーヒーを入れるようにしました！"
tips3 = "ショットでコーヒーを入れてみました！"
made_memo1 = "もう少し時間をかけてドリップしてみよう"
made_memo2 = "いろんな豆乳にもチャレンジしてみたい！"
made_memo3 = "美味しかったからまた作る！"

## 3ユーザー、それぞれ5レシピずつ作成
Drink.create!(
  [
    {
      name: "ドリップコーヒー",
      user_id: 1,
      description: description1,
      portion: portion,
      tips: tips1,
      reference: "https://note.com/yuma_lightup/n/ne5c8b77e6510#folZ1",
      required_time: 10,
      made_memo: made_memo1,
      picture: open("#{Rails.root}/public/images/dripcoffee.jpg"),
      items_attributes: [
                                { name: "コーヒー粉", remarks: "14g/コーヒー豆の方がいいです" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "豆乳カフェラテ",
      user_id: 2,
      description: description3,
      portion: portion,
      tips: tips3,
      reference: "https://mystyle.ucc.co.jp/magazine/a_98/",
      required_time: 5,
      made_memo: made_memo3,
      picture: open("#{Rails.root}/public/images/cafelatte.jpg"),
      items_attributes: [
                                { name: "コーヒー粉", remarks: "14g/コーヒー豆の方がいいです" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "90g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "豆乳", remarks: "70g" },
                                { name: "ガムシロップ", remarks: "10g/お好みで" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "ホワイトモカ",
      user_id: 3,
      description: description3,
      portion: portion,
      tips: tips3,
      reference: "https://cookpad.com/recipe/3619744",
      required_time: 18,
      made_memo: made_memo3,
      picture: open("#{Rails.root}/public/images/whitemocha.jpg"),
      items_attributes: [
                                { name: "ダヴィンチ ホワイトチョコレートシロップ", remarks: "大さじ1と1/2" },
                                { name: "練乳", remarks: "大さじ1" },
                                { name: "牛乳", remarks: "120g" },
                                { name: "コーヒー（エスプレッソ）", remarks: "50g" },
                                { name: "ホイップクリーム", remarks: "適量/お好みで" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "アイスカフェラテ",
      user_id: 1,
      description: description3,
      portion: portion,
      tips: tips2,
      reference: "https://www.kurashiru.com/recipes/3ce5199e-baa8-4d97-a809-9277a46dc95c",
      required_time: 5,
      made_memo: made_memo3,
      picture: open("#{Rails.root}/public/images/icecafelatte.jpg"),
      items_attributes: [
                                { name: "コーヒー（インスタント）", remarks: "100g" },
                                { name: "牛乳", remarks: "150g" },
                                { name: "お湯", remarks: "40g" },
                                { name: "氷", remarks: "適量" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "アメリカーノ",
      user_id: 2,
      description: description3,
      portion: portion,
      tips: tips2,
      reference: "https://www.daiichifl.com/recipe/detail/102-americano-c01-c08.php",
      required_time: 40,
      made_memo: made_memo3,
      picture: open("#{Rails.root}/public/images/american.jpg"),
      items_attributes: [
                                { name: "エスプレッソ", remarks: "30g" },
                                { name: "お湯", remarks: "適量" },
                                { name: "砂糖", remarks: "適量/お好みで" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "ダルゴナコーヒー",
      user_id: 3,
      description: description2,
      portion: portion,
      tips: tips2,
      reference: "https://delishkitchen.tv/recipes/294453041623467066",
      required_time: 20,
      made_memo: made_memo2,
      picture: open("#{Rails.root}/public/images/dalgonacoffee.jpeg"),
      items_attributes: [
                                { name: "コーヒー（インスタント）", remarks: "24g" },
                                { name: "牛乳", remarks: "少々" },
                                { name: "砂糖", remarks: "大さじ4" },
                                { name: "水", remarks: "大さじ4" },
                                { name: "氷", remarks: "適量" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "カプチーノ",
      user_id: 1,
      description: description3,
      portion: portion,
      tips: tips3,
      reference: "https://www.ucc.co.jp/enjoy/recipe/arrange_hot/ar1.html",
      required_time: 10,
      made_memo: made_memo1,
      picture: open("#{Rails.root}/public/images/cappuccino.jpeg"),
      items_attributes: [
                                { name: "エスプレッソ", remarks: "50g" },
                                { name: "牛乳", remarks: "90g" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "カフェモカ",
      user_id: 2,
      description: description2,
      portion: portion,
      tips: tips2,
      reference: "https://www.kurashiru.com/recipes/da0e2bfd-5dd4-4743-8d2e-c1f0a08d2731",
      required_time: 10,
      made_memo: made_memo2,
      picture: open("#{Rails.root}/public/images/cafemocha.jpg"),
      items_attributes: [
                                { name: "コーヒー（インスタント）", remarks: "小さじ1.5" },
                                { name: "牛乳", remarks: "100g" },
                                { name: "お湯", remarks: "40g" },
                                { name: "氷", remarks: "適量" },
                                { name: "チョコレートソース", remarks: "大さじ1" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "豆乳アイスキャラメルラテ",
      user_id: 3,
      description: description3,
      portion: portion,
      tips: tips3,
      reference: "https://cookpad.com/recipe/5355585",
      required_time: 10,
      made_memo: made_memo3,
      picture: open("#{Rails.root}/public/images/caramellatte.jpeg"),
      items_attributes: [
                                { name: "コーヒー", remarks: "小さじ1.5" },
                                { name: "豆乳", remarks: "150g" },
                                { name: "お湯", remarks: "40g" },
                                { name: "キャラメルソース", remarks: "適量" },
                                { name: "氷", remarks: "適量" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" },
                                 { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    }
  ]
)

drink3 = Drink.find(1)
drink6 = Drink.find(4)
drink12 = Drink.find(2)
drink13 = Drink.find(6)
drink14 = Drink.find(5)
drink15 = Drink.find(3)

# お気に入り登録
user3.favorite(drink13)
user3.favorite(drink14)
user1.favorite(drink15)
user2.favorite(drink12)

# コメント
drink15.comments.create(user_id: user1.id, content: "作ってみたいです！")
drink12.comments.create(user_id: user2.id, content: "美味しそうですね！")

# 通知
user3.notifications.create(user_id: user3.id, drink_id: drink15.id,
                           from_user_id: user1.id, variety: 1)
user3.notifications.create(user_id: user3.id, drink_id: drink15.id,
                           from_user_id: user1.id, variety: 2, content: "作ってみたいです！")
user3.notifications.create(user_id: user3.id, drink_id: drink12.id,
                           from_user_id: user2.id, variety: 1)
user3.notifications.create(user_id: user3.id, drink_id: drink12.id,
                           from_user_id: user2.id, variety: 2, content: "美味しそうですね！")
