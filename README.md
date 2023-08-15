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

| Column             | Type   | Options                   |
| -------------------| ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| full_name          | string | null: false               |
| full_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |


### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column       | Type    | Options     |
| ------------ | -------- ------------ |
| item_name    | string  | null: false |
| category_id  | integer | null: false |
| price        | integer | null: false |
| seller_id    | integer | null: false |
| condition     | string |             |
| shipping_fee  | string |             |
| shipping_area | string |             |
| shipping_date | string |             |


### Association

- belongs_to :user
- has_one :buyer


## buyers テーブル

| Column  | Type       | Options                       |
| --------| ---------- | ----------------------------- |
| user    | references | null: false,foreign_key: true |
| item    | references | null: false,foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_addresses


## shipping_addresses テーブル

| Column         | Type    | Options      |
| -------------- | ------- | ------------ |
| postal_code    | string  | null: false  |
| prefecture     | integer | null: false  |
| city           | string  | null: false  |
| house_number   | string  | null: false  |
| building_name  | string  |  
| phone_number   | string  | null: false  |

### Association

- belongs_to :buyers
