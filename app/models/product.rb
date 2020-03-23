class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, :detail, presence: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  belongs_to :brand, optional: true
  belongs_to :size
  belongs_to :condition
  belongs_to :sending_method
  belongs_to :user
  # belongs_to :category

  enum delivery_status: [ "出品中", "取引中", "購入済" ]

  def previous
    Product.order("id DESC").where("id < ?", id).first
  end

  def next
    Product.order("id ASC").where("id > ?", id).first
  end
end
