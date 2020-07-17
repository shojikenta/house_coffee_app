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
      name:  "採用 太郎",
      email: "recruit@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "tomo",
      email: "tomo@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "くっすん",
      email: "kusun@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "yoji",
      email: "yoji@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "翔や",
      email: "shota@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "しゅん",
      email: "syun@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "京子",
      email: "kyoko@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "バリスタ",
      email: "barisuta@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "ゆう",
      email: "yu@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "master",
      email: "master@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "jack",
      email: "jack@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "TOM",
      email: "tom@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "てっぺ",
      email: "teppe@example.com",
      password:              "password",
      password_confirmation: "password",
    },
  ]
)

# フォロー関係
user1 = User.find(1)
user2 = User.find(2)
user3 = User.find(3)
user4 = User.find(4)
user5 = User.find(5)
user6 = User.find(6)
user7 = User.find(7)
user8 = User.find(8)
user9 = User.find(9)
user10 = User.find(10)
user11 = User.find(11)
user12 = User.find(12)
user13 = User.find(13)
user14 = User.find(14)
user15 = User.find(15)
user3.follow(user1)
user3.follow(user2)
user3.follow(user7)
user3.follow(user14)
user8.follow(user14)
user1.follow(user7)
user1.follow(user3)
user1.follow(user8)
user4.follow(user3)
user5.follow(user3)
user6.follow(user3)
user7.follow(user3)
user8.follow(user3)
user9.follow(user3)
user10.follow(user3)
user11.follow(user3)
user12.follow(user3)
user13.follow(user3)
user14.follow(user3)
user15.follow(user3)
user15.follow(user9)


# コーヒーレシピ内容
portion = 1
description1 = "コクがあります！"
description2 = "さっぱりしているのがいいです！"
description3 = "最近ハマっているお気に入りのコーヒー豆です！"
description4 = "苦味の中に甘味もある一押しコーヒー豆です！"
tips1 = "蒸らすのを忘れずに！"
tips2 = "フィルターは濡らさないように気を付けます"
tips3 = "ショットでコーヒーを入れてみました！"
tips4 = "ゆっくり回しながら入れます！"
made_memo1 = "コーヒー豆から挽くとやっぱり美味しい"
made_memo2 = "ミルを使っているとワクワクする！"
made_memo3 = "美味しかったからまた作る！"
made_memo4 = "香りがいいです！"

## ユーザー、レシピ作成
Drink.create!(
  [
    {
      name: "ドリップコーヒー",
      user_id: 1,
      description: description3,
      portion: portion,
      tips: tips1,
      reference: "https://www.ucc.co.jp/enjoy/brew/drip.html",
      required_time: 10,
      made_memo: made_memo1,
      picture: open("#{Rails.root}/public/images/dripcoffee2.jpeg"),
      items_attributes: [
                                { name: "コーヒー粉", remarks: "14g/コーヒー豆の方がいいです" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
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
      picture: open("#{Rails.root}/public/images/icelatte.jpg"),
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
      picture: open("#{Rails.root}/public/images/dalgonacoffee2.jpeg"),
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
    },
    {
      name: "スターバックス・アイスコーヒーブレンド",
      user_id: 1,
      description: description3,
      portion: portion,
      tips: tips1,
      reference: "https://product.starbucks.co.jp/beans/medium/4524785132085/?category=beans&place=2",
      required_time: 10,
      made_memo: made_memo1,
      picture: open("#{Rails.root}/public/images/starbucks1.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "サマーブレンド",
      user_id: 4,
      description: description3,
      portion: portion,
      tips: tips1,
      reference: "https://www.kaldi.co.jp/ec/pro/disp/1/4515996016929?sFlg=2",
      required_time: 10,
      made_memo: made_memo1,
      picture: open("#{Rails.root}/public/images/kaldi1.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "スターバックス カティ カティ ブレンド",
      user_id: 5,
      description: description2,
      portion: portion,
      tips: tips3,
      reference: "https://product.starbucks.co.jp/beans/medium/4524785222328/?category=beans&place=2",
      required_time: 10,
      made_memo: made_memo3,
      picture: open("#{Rails.root}/public/images/starbucks2.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "スターバックス リフトバリー ブレンド",
      user_id: 6,
      description: description4,
      portion: portion,
      tips: tips2,
      reference: "https://product.starbucks.co.jp/beans/dark/4524785415102/?category=beans&place=2",
      required_time: 10,
      made_memo: made_memo2,
      picture: open("#{Rails.root}/public/images/starbucks3.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "スターバックス ルワンダ",
      user_id: 7,
      description: description4,
      portion: portion,
      tips: tips2,
      reference: "https://product.starbucks.co.jp/beans/blonde/4524785415010/?category=beans&place=2",
      required_time: 10,
      made_memo: made_memo2,
      picture: open("#{Rails.root}/public/images/starbucks4.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "ブルーボトルコーヒー豆/定期便",
      user_id: 3,
      description: description4,
      portion: portion,
      tips: tips2,
      reference: "https://store.bluebottlecoffee.jp/",
      required_time: 10,
      made_memo: made_memo2,
      picture: open("#{Rails.root}/public/images/blue.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "TOKYO COFFE",
      user_id: 3,
      description: description1,
      portion: portion,
      tips: tips3,
      reference: "https://www.amazon.co.jp/dp/B01AABXQ4U?tag=s02a3-22",
      required_time: 10,
      made_memo: made_memo1,
      picture: open("#{Rails.root}/public/images/tokyo.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "ジニスコーヒー",
      user_id: 8,
      description: description1,
      portion: portion,
      tips: tips3,
      reference: "https://www.amazon.co.jp/dp/B07HDZ33PK?tag=s02a3-22",
      required_time: 10,
      made_memo: made_memo1,
      picture: open("#{Rails.root}/public/images/diniz.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "加藤珈琲店",
      user_id: 9,
      description: description3,
      portion: portion,
      tips: tips2,
      reference: "https://item.rakuten.co.jp/gourmetcoffee/2630/?scid=af_pc_etc&sc2id=af_117_1_10001720",
      required_time: 10,
      made_memo: made_memo2,
      picture: open("#{Rails.root}/public/images/golden.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "kobe coffee",
      user_id: 10,
      description: description3,
      portion: portion,
      tips: tips2,
      reference: "https://www.amazon.co.jp/dp/B07MYZ1S5N/ref=sspa_dk_detail_0?psc=1&pd_rd_i=B07MYZ1S5N&pd_rd_w=d3OI9&pf_rd_p=6413bd85-d494-49e7-9f81-0e63e79171a9&pd_rd_wg=o1wCI&pf_rd_r=A1T6E5W9Y0H30002BJ36&pd_rd_r=120decba-be30-4b36-afd1-bc17f6feeff6&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyMzg0NVFOVkZLVkpQJmVuY3J5cHRlZElkPUEwODgwMjM0M0pONTJXNVhCVkFWQSZlbmNyeXB0ZWRBZElkPUFOVU5QNUw2TllJU08md2lkZ2V0TmFtZT1zcF9kZXRhaWwmYWN0aW9uPWNsaWNrUmVkaXJlY3QmZG9Ob3RMb2dDbGljaz10cnVl",
      required_time: 10,
      made_memo: made_memo2,
      picture: open("#{Rails.root}/public/images/kobe.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "starbucks カフェベロナ",
      user_id: 11,
      description: description3,
      portion: portion,
      tips: tips2,
      reference: "https://www.amazon.co.jp/dp/B07Z54HSLF?tag=s02a3-22",
      required_time: 10,
      made_memo: made_memo2,
      picture: open("#{Rails.root}/public/images/starbucks5.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "土居珈琲",
      user_id: 12,
      description: description1,
      portion: portion,
      tips: tips3,
      reference: "https://www.amazon.co.jp/dp/B005HFQEIA?tag=s02a3-22",
      required_time: 10,
      made_memo: made_memo2,
      picture: open("#{Rails.root}/public/images/doi.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "ブルーボトルコーヒー豆/定期便",
      user_id: 13,
      description: description1,
      portion: portion,
      tips: tips3,
      reference: "https://store.bluebottlecoffee.jp/",
      required_time: 10,
      made_memo: made_memo2,
      picture: open("#{Rails.root}/public/images/blue.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "TOKYO COFFE",
      user_id: 14,
      description: description2,
      portion: portion,
      tips: tips1,
      reference: "https://www.amazon.co.jp/dp/B01AABXQ4U?tag=s02a3-22",
      required_time: 10,
      made_memo: made_memo1,
      picture: open("#{Rails.root}/public/images/tokyo.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
                                { name: "", remarks: "" },
                                { name: "", remarks: "" }
                              ],
    },
    {
      name: "スターバックス ルワンダ",
      user_id: 15,
      description: description1,
      portion: portion,
      tips: tips3,
      reference: "https://product.starbucks.co.jp/beans/blonde/4524785415010/?category=beans&place=2",
      required_time: 10,
      made_memo: made_memo1,
      picture: open("#{Rails.root}/public/images/starbucks4.png"),
      items_attributes: [
                                { name: "コーヒー豆", remarks: "14g" },
                                { name: "ケトル", remarks: "1つ" },
                                { name: "お湯", remarks: "230g" },
                                { name: "ドリッパー", remarks: "1つ" },
                                { name: "サーバー", remarks: "1つ/直接コップでもOK" },
                                { name: "電子スケール", remarks: "1つ" },
                                { name: "タイマー", remarks: "1つ" },
                                { name: "コーヒーミル", remarks: "1つ" },
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
drink1 = Drink.find(7)

# お気に入り登録
user3.favorite(drink13)
user3.favorite(drink14)
user1.favorite(drink15)
user2.favorite(drink12)
user3.favorite(drink3)
user1.favorite(drink1)


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
