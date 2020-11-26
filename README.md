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

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| birthday   | string | null: false |

## items テーブル

| Column       | Type   | Options     |
| -----------  | ------ | ----------- |
| user_id      | string | null: false |
| image        | string | null: false |
| product name | string | null: false |
| explanation  | string | null: false |
| category     | string | null: false |
| status       | string | null: false |
| burden       | string | null: false |
| area         | string | null: false |
| days         | string | null: false |
| price        | string | null: false |

## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | string | null: false |
| image              | string | null: false |
| product name       | string | null: false |
| explanation        | string | null: false |
| price              | string | null: false |
| credit card number | string | null: false |
| postal code        | string | null: false |
| street address     | string | null: false |
| phone number       | string | null: false |
