# README

## messageテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|
|image|string|
|chatgroup_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :chatgroup
- belongs_to :user

## userテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false  add_index user, :name|
|email|varchar(50)|:email, unique:true|
### Association
- has_many :messages
- has_many :groups, through: :user_chatgroup
- has_many :user_chatgroups

## chatgroupテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
### Association
- has_many :users, through: :user_chatgroup
- has_many :messages
- has_many :user_chatgroups

## 中間テーブル user_chatgroup
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false  foreign_key: true|
|chatgroup_id|references|null: false  foreign_key: true|
### Association
- belongs_to :chatgroup
- belongs_to :user

