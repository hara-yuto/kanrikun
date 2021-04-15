# テーブル設計

## usersテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |


### Association
- has_many :kanrikuns


## kanrikunsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| title     | string     | null: false |
| content   | text       | null: false |
| worktime  | string     |             |
| start_time| datetime   | null: false |
| user      | references | null: false |


### Association
- belongs_to :user