class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,   presence: true, length: { in: 1..20 } ,uniqueness: true
  validates :email,      presence: true, uniqueness: true
  validates :password,   presence: true, length: { in: 7..128 }, confirmation: true, on: :create
end