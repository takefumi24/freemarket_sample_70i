class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, :detail, :shipping_date, :price, :which_postage, :delivery_status, :prefecture, :category_id, :user_id, :size_id, :condition_id, :sending_method_id, presence: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  has_many :comments
  belongs_to :brand, optional: true
  belongs_to :size
  belongs_to :condition
  belongs_to :sending_method
  belongs_to :user
  belongs_to :category

  enum delivery_status: [ "出品中", "取引中", "購入済" ]

  def previous
    Product.order("id DESC").where("id < ?", id).first
  end

  def next
    Product.order("id ASC").where("id > ?", id).first
  end
end
