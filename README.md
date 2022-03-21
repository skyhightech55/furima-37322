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

#テーブル設計

## users テーブル

| Column                |Type    |Options                    |
|---------------------- |------- |-------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| password_conformation | string | null: false               |
| family_name           | string | null: false               |
| first_name            | string | null: false               |
| family_name_kana      | string | null: false               |
| first_name_kana       | string | null: false               |
| birth_year            | string | null: false               |
| birth_day             | string | null: false               |

- has_many :items
- has_many :orders


## items　テーブル

| Column           |Type     | Options                        |
|----------------- |-------- |------------------------------- |
| name             | string  | null: false                    |
| introduction     | text    | null: false                    |
| item_category    | string  | null: false                    |
| item_condition   | string  | null: false                    |
| shipping_cost    | string  | null: false                    |
| consignor_region | string  | null: false                    |
| shipping_days    | integer | null: false                    |  
| price            | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

- has_one    :items
- belongs_to :users


## deliver_adresses　テーブル

| Column     | Type    | Options     |
|----------- |-------- |------------ |
| post_code  | integer | null: false |
| prefecture | string  | null: false |
| city       | string  | null: false |
| adress1    | string  | null: false |
| adress2    | string  |             |
| telephone  | integer |             |

- belongs_to :orders


## orders　テーブル

| Column  | Type    | Options                        |
|-------- |-------- |------------------------------- |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

- belongs_to :users
- belongs_to :items
- has_one    : deliver_adresses






