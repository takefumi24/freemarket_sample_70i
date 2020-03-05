# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

conflict test

* ...

hello

test_test

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|

### Association
- has_one :profile
- has_one :credit_card
- has_many :comments
- accepts_nested_attributes_for :profile


# productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|shipping_date|integer|null: false|
|price|integer|null: false|
|buyer_id|integer|foreign_key: { to_table: :users }
|which_postage|integer|null: false|
|delivery_status|integer|null: false|
|prefecture_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|size_id|references|foreign_key: true|
|condition_id|references|null: false, foreign_key: true|
|sending_method_id|references|null: false, foreign_key: true|

### Association
- has_many :images
- has_many :comments
- belongs_to:user
- belongs_to :category
- belongs_to :brand
- belongs_to :prefecture
- belongs_to :size
- belongs_to :condition
- belongs_to :sending_method



# profilesテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|name|string|null: false|
|family_name_kana|string|null: false|
|name_kana|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string|null: false|
|image|text|-------|
|introduction|text|-------|
|postal_code|integer|null: false|
|phone|integer|-------|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|prefecture_id|references|foreign_key: true|

### Association
- belongs_to:user, inverse_of: :user_address
- belongs_to :prefecture


# credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|exp_month|integer|null: false|
|exp_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to:user



# prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products
- has_many :profiles


# brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|-------|

### Association
- has_many :products
- has_many :categories, through: :category_brands
- has_many :category_brands



# categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|-------|

### Association
- has_many :products
- has_many :brands, through: :category_brands
- has_many :category_brands



# category_brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :brand



# sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products


# imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|text|null: false|
|product_id|references|foreign_key: true|

### Association
- belongs_to :product


# conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products


# sending_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :user
- belongs_to :product
