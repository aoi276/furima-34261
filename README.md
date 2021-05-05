# テーブル設計

##  usersテーブル

| Column     | | Type   | Options     |
| ---------- | | ------ | ----------- |
| nickname   | | string | null: false |
| email      | | string | null: false |
| password   | | string | null: false |
| name1      | | string | null: false |
| name2      | | string | null: false |
| birathday  | | string | null: false |

### Association
hasmany :items
hasmany :buyers


##  itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      |            |                                | 
| itemname   | string     | null: false                    |
| text       | text       | null: false                    |
| category   | string     | null: false                    |
| state      | string     | null: false                    |
| burden     | integer    | null: false                    |
| locality   | string     | null: false                    |
| delivery   | string     | null: false                    |
| price      | integer    | null: false                    |
| user       | reference  | null: false, foreign_key: true |

### Association
belongs :user
has_one :buyers

##  buyersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| card_info    | integer    | null: false                    |
| exp_date     | integer    | null: false                    |
| security     | integer    | null: false                    | 
| postal_code  | integer    | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| street       | string     | null: false                    |
| building     | string     | null: false                    |
| phone        | integer    | null: false                    |
| user         | reference  | null: false, foreign_key: true |
| item         | reference  | null: false, foreign_key: true |

### Association
belongs :user
belongs :item