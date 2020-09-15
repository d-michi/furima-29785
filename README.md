# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :card
- has_many :order
- has_many :item

## cards テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| card_exp_month  | integer    | null: false                    |
| card_exp_year   | integer    | null: false                    |
| card_cvc        | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| card    | references | null: false, foreign_key: true |
| address | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :card
- belongs_to :user
- belongs_to :item

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | string     | null: false                    |
| item_explain             | text       | null: false                    |
| image                    | string     | null: false                    |
| price                    | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |
| prefecture               | integer    | null: false                    |
| item_category            | integer    | null: false                    |
| item_sales_status        | integer    | null: false                    |
| item_shipping_fee_status | integer    | null: false                    |
| item_scheduled_delivery  | integer    | null: false                    |


### Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :item_category
- belongs_to_active_hash :item_sales_status
- belongs_to_active_hash :item_shipping_fee_status
- belongs_to_active_hash :item_scheduled_delivery

## address テーブル

| Colum        | Type       | Options       |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false, foreign_key: true |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to_active_hash :prefecture