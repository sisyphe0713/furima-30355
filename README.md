# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| name           | string     | null: false                    |
| price          | string     | null: false                    |
| text           | text       | null: false                    |
| category       | string     | null: false                    |
| status         | string     | null: false                    |
| delivery_fee   | string     | null: false                    |
| shipment_source| string     | null: false                    |
| ship_days      | string     | null: false                    |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one :address


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| order_id       | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address_number | string     | null: false                    |
| telephone      | string     | null: false                    |

### Association

- belongs_to : order