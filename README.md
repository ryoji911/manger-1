# アプリケーション名
# 「Manger」 （ マンジェ ）
![90e905754ddf98a1bf28c8928281cc6e](https://user-images.githubusercontent.com/74886411/103196953-75defe80-4928-11eb-82b3-269fed7d096c.jpg)

# 概要
「Manger（マンジェ）」とはフランス語の食べるという意味の言葉です。  
開発者である私が、コックとして働いていたとき、まかないのことをMangerと呼んでいました。  
このアプリは、料理人が作るまかないに特化したレシピアプリです。

# URL
https://manger-1.herokuapp.com/

# テスト用アカウント
・email: test@test  
・password: 123abc

# 利用方法
トップページの写真をクリックすることで、まかないのレシピを閲覧することができます。

# 目指した問題解決
・プロの料理人が、様々な工夫を凝らして作るまかないを、多くの人に見てもらえないのはもったいない  
・料理人が、自身の作った料理をアピールする場がない  
・グルメサイト等以外で、飲食店の宣伝をする場がない  

# 使用技術
・フレームワーク：Rails6.0.3  
・CSS フレームワーク：Bootstrap  
・サーバーサイド言語：Ruby2.6.6  
・データベース：MySQL  
・ヴァージョン管理：GitHub  
・デプロイ環境：heroku  
・ユーザー管理：devise  
・画像投稿： Active_Storage  
・ページネーション： kaminari  
・使用マシン：Mac Catalina(10.15.5)  
・開発期間（約 1 週間）  

# 機能
## ・ユーザーログイン機能
ユーザーである料理人は、名前、メールアドレス、パスワード、自身の料理のジャンル、店名、URL、経歴を入力することで、ユーザー登録することができます。

## ・レシピ投稿機能
ユーザーである料理人は、まかないのレシピを投稿することができます。

## ・レシピ一覧表示機能
投稿したレシピの写真、名前、作成時間、いいねの件数が一覧で表示されます。

## ・レシピ詳細表示機能
レシピの写真、作成者、作り方、材料、ポイント、作成時間が表示されます。  
レシピの閲覧は、ログインしていなくても可能です。

## ・レシピ編集／削除機能
投稿したレシピを編集、削除することができます。

## ・検索機能
キーワードを入力することで、レシピの検索ができます。

## ・コメント投稿機能
レシピに対して、コメントを投稿することができます。

## ・いいね機能
レシピに対して、いいねを投稿することができます。  
また、いいねの件数が、レシピ詳細と、一覧ページに表示されます。

## ・ユーザー詳細表示機能
レシピの作成者の詳細ページでは、作成者の名前、料理のジャンル、店名、URL、経歴が表示されます。


# 実装予定の機能
・ユーザー一覧機能  
・ユーザー詳細に、google Maps APIを使って、店の地図の表示


# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| image      |        | null: false |
| genre_id   | string | null: false |
| restaurant | string | null: false |
| url        | string |             |
| career     | text   | null: false |

### Association
- has_many :recipes
- has_many :comments
- has_many :likes

## recipe テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| menu_name | string | null: false |
| material  | text   | null: false |
| process   | text   | null: false |
| image     |        | null: false |
| point     | text   | null: false |
| time      | string | null: false |

### Association
- belongs_to :user
- has_many :comments
- has_many :likes

## comment テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| recipe  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recipe

## like テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| recipe  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recipe