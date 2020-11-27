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

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name(hurigana)  | string | null: false |
| first_name(hurigana) | string | null: false |
| date                 | string | null: false |

## items テーブル

| Column       | Type       | Options     |
| -----------  | ---------- | ----------- |
| user         | references | null: false |
| product_name | string     | null: false |
| explanation  | string     | null: false |
| category     | string     | null: false |
| status       | string     | null: false |
| burden       | string     | null: false |
| area         | string     | null: false |
| days         | string     | null: false |
| price        | string     | null: false |

## order テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | string | null: false |
| item_id            | string | null: false |
| image              | string | null: false |
| product_name       | string | null: false |
| explanation        | string | null: false |
| price              | string | null: false |
| postal_code        | string | null: false |
| prefectures        | string | null: false |
| municipalities     | string | null: false |
| address            | string | null: false |
| building_name      | string | null: false |
| phone_number       | string | null: false |

## order_history

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | string | null: false |
| item_id            | string | null: false |