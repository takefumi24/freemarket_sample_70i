class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :shipping_date, :price, :which_postage, :delivery_status, :prefecture, :user_id, presence: true
  validates :images , presence: true, length: {maximum: 10}
  validates :name, presence: true, length: {maximum: 40}
  validates :detail, presence: true, length: {maximum: 1000}
  validate :check_categories
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
  belongs_to :category
  has_many :product_users, dependent: :destroy
  has_many :product, through: :product_users, source: :user_id


  enum delivery_status: [ "出品中", "取引中", "購入済" ]

  def previous
    Product.order("id DESC").where("id < ?", id).first
  end

  def next
    Product.order("id ASC").where("id > ?", id).first
  end

  # ユーザーがいいね済みか判定
  def like_by?(user)
    product_users.where(user_id: user.id).exists?
  end

  def check_categories
    has_error = false
    category_products.each do |cat|
      has_error = true if cat.id == 0
    end
    if has_error
      errors.add(:categories, "の内容が不正です")
    end
  end
end
