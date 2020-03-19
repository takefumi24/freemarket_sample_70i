class ProductsController < ApplicationController
  include CommonActions
  before_action :set_categories
  
  def index
    product = Product.出品中
    @products = product.includes(:images).limit(3).order(id: "DESC") 
    @brand_products = brand_ranks(product)
  end

  def new
    @product = Product.new
    @product.images.build()
    @sizes = Size.all
    @conditions = Condition.all
    @sending_methods = SendingMethod.all
    @prefectures = Prefecture.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @product.images.build
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @prefecture = Prefecture.find(@product.prefecture)
  end

  def edit
    # 編集機能実装用
    @product = Product.find(params[:id])
  end

  def update
    # 編集機能実装用
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to action: :show
  end

  def destroy
    # 削除機能実装用
    # product = Product.find(params[:id])
    # product.destroy
    # redirect_to root_path
  end

  def buy
    @user = current_user
    @product = Product.find(params[:id])
    @prefecture = Prefecture.find(@user.prefecture)

    card = CreditCard.find_by(user_id: @user.id)
    unless card.blank?
      Payjp.api_key = Rails.application.credentials[:payjp][:private_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @credit_card = customer.cards.retrieve(card.card_id)
      @exp_month = @credit_card.exp_month.to_s
      @exp_year = @credit_card.exp_year.to_s.slice(2,3)
    end
  end 


  def product_params
    params.require(:product).permit(:name, :category_id, :brand_id, :price, :detail, :condition_id, :which_postage, :sending_method_id, :size_id, :prefecture, :shipping_date, images_attributes: [:image]).merge(user_id: current_user.id)
  end 

  # 出品中商品のうち、出品が多いブランドを取得し、そのブランドに属する最新の出品商品を取得
  def brand_ranks(product)
    targets =[]
    brand_ranks = Brand.find(product.group(:brand_id).order('count(brand_id) desc').limit(3).pluck(:brand_id))
    brand_ranks.each do |brand|
      target = product.where(brand_id: brand.id).order(:created_at).last
      targets << target
    end
    return targets
  end
end
