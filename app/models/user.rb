class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products, dependent: :destroy
  has_many :product_users, dependent: :destroy
  has_many :puroducts, through: :product_users, source: :product_id

  has_one :credit_card

  validates :nickname,         presence: true, length: { in: 1..20 }, uniqueness: true
  validates :email,            presence: true, uniqueness: true
  validates :password,         presence: true, length: { in: 7..128 }, confirmation: true, on: :create
  validates :family_name,      presence: true
  validates :name,             presence: true
  validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :name_kana,        presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :prefecture,       presence: true, numericality: { only_integer: true }
  validates :city,             presence: true
  validates :street,           presence: true
  validates :postal_code,      presence: true, numericality: { only_integer: true }, length: { in: 7..7 }
  validates :phone,            presence: true, numericality: { only_integer: true }, length: { in: 10..11 }, uniqueness: true
  validates :birth_year,       presence: true, numericality: { only_integer: true }
  validates :birth_month,      presence: true, numericality: { only_integer: true }
  validates :birth_day,        presence: true, numericality: { only_integer: true }


  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end