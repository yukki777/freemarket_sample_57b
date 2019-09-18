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
- has_one: address


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|-|
|building_phone_number|string|-|
|prefecture|integer|null: false|
|user_id|integer|foreign_key: true|

### Association
- belongs_to: user
- has_one: product


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false|
|brand_id|integer|-|
|postage_id|integer|null: false|
|shipping_method_id|integer|null: false|
|size_id|integer|null: false|
|shipping_date_id|integer|null: false|
|condition_id|integer|null: false|


### Association

- belongs_to: address
- belongs_to: user
- has_many: images
- has_many: product-categories
- has_many: categories, through: :product-categories


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to: product


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|integer|-|

### Association
- has_many: product-categories
- has_many: products, through: :product-categories


## product_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|category_id|integer|foreign_key: true|

### Association
- belongs_to: product
- belongs_to: category