# README

## messageテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|
|image|string|
|chatgroup-id|integer|null: false, foreign_key: true|
|user-id|integer|null: false, foreign_key: true|
|created_at|datetime|
### Association
- belongs_to :chatgroup
- belongs_to :user

## userテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|email|varchar(50)|add_index :user, :email, unique:true|
### Association
- has_many :messages
- has_many :groups


## chatgroupテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
### Association
- has_many :users
- has_many :messages


## 中間テーブル user-chatgroup
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|chatgroup_id|integer||
### Association
- belongs_to :chatgroup
- belongs_to :user

