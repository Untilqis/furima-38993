# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false, unique: true |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false, unique: true |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_kana_name        | string  | null: false               |
| first_kana_name       | string  | null: false               |
| date_of_birth         | integer | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs  :users
- has_one  :purchases

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     |             |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building      | string     |             |
| phone_number  | integer    | null: false |

### Association

- belongs_to :order
- has_one    :payment