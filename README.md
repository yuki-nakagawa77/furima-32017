# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| nickname             | string   | null: false |
| email                | string   | null: false |
| encrypted_password   | string   | null: false |
| last_name            | string   | null: false |
| first_name           | string   | null: false |
| last_name(hurigana)  | string   | null: false |
| first_name(hurigana) | string   | null: false |
| date                 | birthday | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :orders_history

## items テーブル

| Column       | Type       | Options     |
| -----------  | ---------- | ----------- |
| user         | references | null: false |
| product_name | string     | null: false |
| explanation  | string     | null: false |
| category_id  | integer    | null: false |
| status_id    | integer    | null: false |
| burden_id    | integer    | null: false |
| area_id      | integer    | null: false |
| days_id      | integer    | null: false |
| price        | integer    | null: false |

### Association

- belongs_to :user
- has_one    :orders
- has_many   :orders_history

## orders テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| postal_code        | string  | null: false |
| prefecture_id      | integer | null: false |
| municipalities     | string  | null: false |
| address            | string  | null: false |
| building_name      | string  |             |
| phone_number       | string  | null: false |

### Association

- belongs_to :user
- has_many   :items
- belongs_to :orders_history

## orders_history

| Column             | Type   | Options           |
| ------------------ | ------ | ----------------- |
| user_id            | string | foreign_key: true |
| item_id            | string | foreign_key: true |

### Association

- belongs_to   :user
- belongs_to   :items
- has_many     :orders