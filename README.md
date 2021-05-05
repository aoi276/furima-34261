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
hasmany :items
hasmany :buyers


##  itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| itemname   | string     | null: false                    |
| text       | text       | null: false                    |
| genre      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

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
| postal_code  | integer    | null: false                    |
| genre        | integer    | null: false                    |
| municipality | string     | null: false                    |
| street       | string     | null: false                    |
| building     | string     | null: false                    |
| phone        | string     | null: false                    |
| buyer        | references | null: false, foreign_key: true |

### Association
belongs_to :buyer