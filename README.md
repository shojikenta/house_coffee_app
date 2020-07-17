# アプリケーションの概要
お気に入りのコーヒーやコーヒー豆、コーヒーの淹れ方など投稿できるようなSNSです。 <https://house-coffee-app2.herokuapp.com/>

# 制作背景
普段からコーヒーをドリップしたりするのが好きで、お気に入りのコーヒー豆やコーヒーをシェアできるサービスがあればいいなと思い、制作に至りました。

# 技術的ポイント
・**RSpec**でModel, Request, Systemテスト記述（計173examples）
・**Ajax**を用いた非同期処理（フォロー/未フォロー、お気に入り登録/未登録などの切り替え表示）
・**Bootstrap**によるレスポンシブ対応
・**Rubocop**を使用したコード規約に沿った開発 

# 使用技術
・HTML/CSS
・Javascript / JQuery / Ajax
・Bootstrap
・Ruby 2.5.7
・Ruby on Rails 5.2.3
・RSpec / Rubocop
・PostgreSQL
・Nginx (Web Server)
・Puma (Application Server)
・Linux (各種コマンド操作等)
・Git / GitHub (pull request, Milestones, Issues 等による擬似チーム開発)
・Docker / docker-compose
・CircleCI/CD

# アプリケーションの機能
・コーヒーレシピの投稿機能
・投稿内容一覧表示機能
・画像投稿機能 （CarrierWaveを使用） 
・フォロー/アンフォロー機能
・お気に入り登録  
・コメント機能
・通知機能（お気に入り登録 or コメントがあった場合）  
・検索機能（Ransackを使用）  
・CSV出力機能
・ログイン機能
・ログイン状態の保持  
・アカウント作成機能
・ページネーション機能
・モデルに対するバリデーション  
・単体テスト機能
・統合テスト機能
