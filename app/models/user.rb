class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, inverse_of: :user
  accepts_nested_attributes_for :profile

  validates :nickname,   presence: true, length: { in: 1..20 }, uniqueness: true
  validates :email,      presence: true, uniqueness: { case_sensitive: false }
  validates :password,   presence: true, length: { in: 6..128 }, confirmation: true, on: :create

end
