#　テーブル設計

## users テーブル
|Column    | Type     |Options     |
| -------  | -------- | ---------- |
|nick_name |string    | null:false |
|email     |string    | null:false |
|password  |string    | null:false |
|last_name |string    | null:false |
|first_name|string    | null:false |
|birth_day |integer   | null:false |
### Association
- has_many : items
- has_many : purchases

## items テーブル
|Column          | Type     |Options                      |
| -------------  | ---------| --------------------------- |
|item_name       |string    |null: false                  |
|description     |text      |null: false                  |
|condition_id    |integer   |null: false                  |
|postage_id      |integer   |null: false                  |
|prefecture_id   |integer   |null: false                  |
|handling_time_id|integer   |null: false                  |
|category_id     |integer   |null: false                  |
|price           |integer   |null: false                  |
|user_id         |references|null: false, foreign_key:true|
### Association
- belongs_to :user
- has_one :purchase

##　 purchases テーブル
|Column      | Type     |Options                      |
| --------   | ---------  | ------------------------- |
| item_id    | references |null:false,foreign_key:true|
| user_id    | references |null:false,foreign_key:true|
| address_id | references |null:false,foreign_key:true|
### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address

##  addresses　テーブル
|Column       | Type     |Options                      |
| --------    | ---------  | ------------------------- |
|postal_code  | integer    |null:false,                |
|prefectures  | string     |null:false,foreign_key:true|
|city         | string     |null:false                 |
|house_number | integer    |null:false                 |
|building_name| string     |                           |
|pone_number  | integer    |null:false                 |
### Association
- has_one :purchase