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
| content   | string     | null: false |
| user      | references |             |


### Association
- belongs_to :user