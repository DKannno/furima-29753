#　テーブル設計

## users テーブル
|Column         | Type     |Options     |
| ------------- | -------- | ---------- |
|nick_name      |string    | null:false |
|email          |string    | null:false |
|password       |string    | null:false |
|last_name      |string    | null:false |
|first_name     |string    | null:false |
|last_name_kana |string    | null:false |
|first_name_kana|string    | null:false |
|birth_day      |date      | null:false |
### Association
- has_many : items
- has_many : purchases

## items テーブル
|Column          | Type     |Options                      |
| -------------  | ---------| --------------------------- |
|name            |string    |null: false                  |
|description     |text      |null: false                  |
|condition_id    |integer   |null: false                  |
|postage_id      |integer   |null: false                  |
|prefecture_id   |integer   |null: false                  |
|handling_time_id|integer   |null: false                  |
|category_id     |integer   |null: false                  |
|price           |integer   |null: false                  |
|user            |references|null: false,foreign_key:true |
### Association
- belongs_to :user
- has_one    :purchase

##　 purchases テーブル
|Column      | Type     |Options                      |
| --------   | ---------  | ------------------------- |
| item       | references |null:false,foreign_key:true|
| user       | references |null:false,foreign_key:true|
### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

##  addresses　テーブル
|Column        | Type     |Options                      |
| ------------ | ---------  | ------------------------- |
|postal_code   | string     |null:false                 |
|prefectures_id| integer    |null:false                 |
|city          | string     |null:false                 |
|house_number  | string     |null:false                 |
|building_name | string     |                           |
|pone_number   | string     |null:false                 |
### Association
- belongs_to :purchase