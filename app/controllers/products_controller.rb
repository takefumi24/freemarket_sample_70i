class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]
  include CommonActions
  before_action :set_categories
  before_action :move_to_sign_in, except: [:index, :show]
  
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
    @main_categories = Category.where(id: 1..13)
    @prefecture = Prefecture.find(@product.prefecture)
    respond_to do |format|
      format.html
      format.json {render json: {
        images: @product.images,
        categories: @product.categories
      }}
    end
  end

  def edit
    @prefecture = Prefecture.find(@product.prefecture)
  end

  def update
    # 編集機能実装用
    @product = Product.find(params[:id])
    # redirect_to new_user_session_path unless user_signed_in?
    if @product.update(product_params)
      redirect_to root_path
    else
      @product.images.build
      redirect_to action: :edit
    end
  end
  
  def destroy
   # 削除機能実装用
   product = Product.find(params[:id])

    if product.destroy
      redirect_to root_path
    else
      redirect_to product_path(product.id)
    end
  end
  
  def buy
    @user = current_user
    @product = Product.find(params[:id])
    redirect_to root_path if @user.id == @product.user_id

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
  
  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
  def product_params
    params.require(:product).permit(:name, :brand_id, :price, :detail, :condition_id, :which_postage, :sending_method_id, :size_id, :prefecture, :shipping_date, images_attributes: [:image, :_destroy, :id], category_ids: []).merge(user_id: current_user.id)
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

  def set_product
    @product = Product.find(params[:id])
  end
end
