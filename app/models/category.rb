class Category < ApplicationRecord
  has_many :products
  has_many :brands, through: :category_brands
  has_many :category_brands
  # これがカテゴリの階層を作り上げるgemの記述
  has_ancestry
end
