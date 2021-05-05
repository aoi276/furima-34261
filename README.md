# テーブル設計

##  usersテーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false unique:true |
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| second_name        | string | null: false             |
| first_kname        | string | null: false             |
| second_kname       | string | null: false             |
| birathday          | date   | null: false             |

### Association
has_many :items
has_many :buyers


##  itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| text        | text       | null: false                    |
| state_id    | integer    | null: false                    |
| burden_id   | integer    | null: false                    |
| locality_id | integer    | null: false                    |
| delivery_id | integer    | null: false                    |
| category_id | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :buyer

##  buyersテーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| user         | references  | null: false, foreign_key: true |
| item         | references  | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :addresse

##  Addressesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| locality_id  | integer    | null: false                    |
| municipality | string     | null: false                    |
| street       | string     | null: false                    |
| building     | string     |                                |
| phone        | string     | null: false                    |
| buyer        | references | null: false, foreign_key: true |

### Association
belongs_to :buyer