class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  has_many :comments
  belongs_to :brand, optional: true
  belongs_to :size
  belongs_to :condition
  belongs_to :sending_method
  belongs_to :user
  belongs_to :category

  def previous
    Product.order("id DESC").where("id < ?", id).first
  end

  def next
    Product.order("id ASC").where("id > ?", id).first
  end
end
