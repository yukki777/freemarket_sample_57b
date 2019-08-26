# README


# Database設計


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|nickname|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|birthday|date|null: false|
|phone_number|string|null: false|

### Association
- has_many: products
- has_many: addresses
- belongs_to: prefecture


## addressesテーブル

|postal_code|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|-|
|building_phone_number|string|-|
|prefecture_id|string|null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: prefecture


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|postage|integer|null: false|
|price|integer|null: false|
|description|text|null: false|
|status|string|null: false|
|shipping_date|string|null: false|
|prefecture_id|string|null: false, foreign_key: true|

### Association
- has_many: images
- belongs_to: prefecture
- belongs_to: category
- belongs_to: user


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|

### Association
- belongs_to: product


## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many: addresses
- has_many: products


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category|string|null: false|

### Association
- has_many: products
