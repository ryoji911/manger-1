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

## comment テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| recipe  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recipe
