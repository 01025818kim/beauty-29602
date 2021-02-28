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

| COlumn             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :articles
- has_many :comments

## articles テーブル

| Column             | Type       | Options                        |
| ------------------ | --------   | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| title              | string     | null: false                    |
| genre_id           | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| text               | text       | null: false                    |

### Association
- belongs_to :user
- has_many :comments

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | --------   | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| article            | references | null: false, foreign_key: true |
| comment            | text       | null: false                    |


