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

- has_many :orders
- has_many :items

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## items テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| price                       | integer    | null: false                    |
| user                        | references | null: false, foreign_key: true |
| prefecture_id               | integer    | null: false                    |
| item_category_id            | integer    | null: false                    |
| item_sales_status_id        | integer    | null: false                    |
| item_shipping_fee_status_id | integer    | null: false                    |
| item_scheduled_delivery_id  | integer    | null: false                    |


### Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :item_category
- belongs_to_active_hash :item_sales_status
- belongs_to_active_hash :item_shipping_fee_status
- belongs_to_active_hash :item_scheduled_delivery

## address テーブル

| Colum         | Type       | Options       |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to_active_hash :prefecture