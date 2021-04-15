# アプリケーション名
## kanrikun (ビジネスマン向け予定、労働時間管理アプリケーション)

# アプリケーション概要

働き方改革と言われる時代を背景に、会社管理だけでなく
自身での管理を行い日々の記録を残す。
簡易の労働時間計算を用いて、時間管理の徹底を自身で行う。

# URL
 https://kanrikun.herokuapp.com/
 ID/Pass
■       ID: admin
■       Pass: 2222

テスト用アカウント等
ログイン１
■       メールアドレス: test1@test
■       パスワード: test1234

ログイン２
■       メールアドレス: test2@test
■       パスワード: test5678

# Githubリポジトリ
https://github.com/hara-yuto/kanrikun.git

# 利用方法
・   トップページから新規登録・ログイン
・   ログインユーザー専用のトップページに遷移
・   トップページ上でスケジュール登録が可能
・   登録後カレンダーにタイトルが表示される

[![Image from Gyazo](https://i.gyazo.com/1bcc34e9fa0457ae53b5a04b37ee1407.gif)](https://gyazo.com/1bcc34e9fa0457ae53b5a04b37ee1407)

[![Image from Gyazo](https://i.gyazo.com/962789ab2fe8d8a766950f4ccbd1c7cd.gif)](https://gyazo.com/962789ab2fe8d8a766950f4ccbd1c7cd)


・   カレンダーのタイトルをクリックすると詳細ページに遷移
・   編集,削除ボタンが表示される
・   編集情報が保存されると詳細ページに遷移
・   削除ボタンで情報が削除されトップページに遷移

[![Image from Gyazo](https://i.gyazo.com/0805c16c4b56ecc2c28229cedb269765.gif)](https://gyazo.com/0805c16c4b56ecc2c28229cedb269765)

[![Image from Gyazo](https://i.gyazo.com/1170a19771580eceae2e329e2a085919.gif)](https://gyazo.com/1170a19771580eceae2e329e2a085919)

[![Image from Gyazo](https://i.gyazo.com/70f89d0c723a7eb29f18d0619493200b.gif)](https://gyazo.com/70f89d0c723a7eb29f18d0619493200b)


・   トップページ上部にある「労働計算機」をクリックで簡易計算専用ページに遷移
・   上部のルール確認後、下部の欄に数字を入力し計算ボタンで結果出力
・   前提として、平日労働のみの計算機能となっている
・   左「週単位」,中「月単位」,右「メモ」
・   左「週単位」では月曜日〜金曜日までの１日の労働時間を入力し総労働時間と週の法定労働時間を計算
・   中「月単位」では月の総労働日数と１日あたりの平均労働時間、所定・法定労働時間を入力し月の残り法定労働時間と残業時間を計算
・   右「メモ」では計算した内容などをメモするために活用
・   １日の法定労働時間、月の残り法定労働時間を超えた場合はアラート発生

[![Image from Gyazo](https://i.gyazo.com/e9af5d71da07b5c7fa86ded748d5b116.gif)](https://gyazo.com/e9af5d71da07b5c7fa86ded748d5b116)

[![Image from Gyazo](https://i.gyazo.com/52bc9665db491d04294dceda90aaf20f.gif)](https://gyazo.com/52bc9665db491d04294dceda90aaf20f)

[![Image from Gyazo](https://i.gyazo.com/07b73590d4243dfe7b8d894f6357bb3f.gif)](https://gyazo.com/07b73590d4243dfe7b8d894f6357bb3f)

# 課題解決

| ユーザーストーリーから考える課題  |  課題解決                                                           |
| ----------------------------------|  ------------------------------------------------------------------ |
| サラリーマンの業務の管理課題      |  日々のタスク管理やアポイントなど業務にまつわることをメインで残せる |
| 働き方改革が言われる労働時間課題  |  労働時間などは会社管理だけでなく、自身での管理も必要               |
| プライバシーや個人情報の課題      |  センシティブな内容のためユーザー管理で自分だけのページで管理できる |

# 機能一覧

| 機能                 |  概要                                     |
| -------------------- |  ---------------------------------------- |
| ユーザー管理機能     |  新規登録・ログイン・ログアウトが可能     |
| カレンダー機能       |  投稿したイベントを表示することが可能     |
| イベント投稿機能     |  カレンダーにイベントを投稿することが可能 |
| 詳細機能             |  各投稿詳細が詳細ページで閲覧可能         |
| 編集機能             |  投稿者本人のみ投稿編集が可能             |
| 削除機能             |  投稿者本人のみ投稿削除が可能             |
| 計算機能             |  非同期通信で労働時間の計算が可能         |

## カレンダー機能

| 特徴                                       |  概要                                                         |
| ------------------------------------------ |  ------------------------------------------------------------ |
| 投稿者かつログイン者のみ表示               |  他者と共有するのではなく、自分だけのスケジュール管理         |
| 投稿機能とカレンダーを１つのページで表示   |  同じページで反映確認ができるため、ページ遷移のストレス軽減   |


## 計算機能

| 特徴                          |  概要                                                                           |
| ----------------------------- |  ------------------------------------------------------------------------------ | 
| 労働基準法に基づいて計算      |  ３６協定を締結している企業を前提に自分の労働時間や残り法定労働時間を計算できる |
| 非同期通信を活用              |  通信量の削減が可能となり、パフォーマンスの向上                                 |


# ローカルでの動作方法
•  WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
         ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
•  接続先およびログイン情報については、上記の通りです。
•  ログイン・新規登録 → トップページ → イベント投稿 → 
•  確認後、ログアウト処理をお願いします。


# 開発環境
・VScode
・Ruby 2.6.5
・Rails 6.0.3.6
・mysql2 0.4.4
・JavaScript
・gem 3.0.3
・heroku 7.52.0


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