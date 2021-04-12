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
| content   | text       |             |
| worktime  | string     |             |
| start_time| datetime   |             |
| user      | references |             |


### Association
- belongs_to :user