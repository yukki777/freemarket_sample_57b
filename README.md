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
|address_id|integer|null: false, foreign_key: true|
|postage_id|integer|foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|shipping_method_id|integer|foreign_key: true|
|size_id|integer|foreign_key: true|
|shipping_date_id|integer|foreign_key: true|
|condition_id|integer|foreign_key: true|


### Association

- belongs_to: address
- belongs_to: user
- belongs_to: brand
- belongs_to: postage
- belongs_to: condition
- belongs_to: shipping_date
- belongs_to: size
- belongs_to: shipping_method
- has_many: images
- has_many: product-categories
- has_many: categories, through: :product-categories


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to: product


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|brand_id|integer|foreign_key: true|

### Association
- has_many: product-categories
- has_many: products, through: :product-categories
- belongs_to: brand


## postagesテーブル

|Column|Type|Options|
|------|----|-------|
|payment|string|null: false|

### Association
- has_one: product


## shipping_methodsテーブル

|Column|Type|Options|
|------|----|-------|
|method|string|null: false|

### Association
- has_one: product


## product-categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|category_id|integer|foreign_key: true|

### Association
- belongs_to: product
- belongs_to: category

## conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

### Association
- has_one: product


## shipping_datesテーブル

|Column|Type|Options|
|------|----|-------|
|date|string|null: false|

### Association
- has_one: product


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
- has_one: product


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many: products
- has_many: categories