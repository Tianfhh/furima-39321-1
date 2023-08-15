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


## usersテーブル

| Column         | Type   | Options                   |
| ---------------| ------ | ------------------------- |
| nicknam        | string | null: false               |
| email          | string | null: false, unique: true |
| password       | string | null: false               |
| full_name      | string | null: false               |
| full_name_kana | string | null: false               |
| birth_date     | date   | null: false               |


### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column    | Type    | Options     |
| --------- | -------- ------------ |
| item_name | string  | null: false |
| category  | string  | null: false |
| price     | integer | null: false |
| seller_id | integer | null: false |


### Association

- belongs_to :users
- has_one :buyers


## buyers テーブル

| Column  | Type  | Options                         |
| --------| ------- | --------------------     ---- |
| user_id | integer | null: false,foreign_key: true |
| item_id | integer | null: false,foreign_key: true |


### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping_addresses


## shipping_addresses テーブル

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| address  | string  | null: false                    |
| buyer_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :buyer
