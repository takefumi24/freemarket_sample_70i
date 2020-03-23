class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]
  def index
    product = Product.where(delivery_status: "出品中")
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
    # redirect_to product_path(@product.id) if current_user.id != @product.user_id

  end

  def update
    # 編集機能実装用
    @product = Product.find(params[:id])
    # redirect_to new_user_session_path unless user_signed_in?
    # binding.pry
    if @product.update(product_params)
    # binding.pry
      redirect_to root_path
    else
      @product.images.build
      redirect_to action: :edit
    end
  end

  def destroy
  end

  def buy
  end

    def product_params
      params.require(:product).permit(:name, :brand_id, :price, :detail, :condition_id, :which_postage, :sending_method_id, :size_id, :prefecture, :shipping_date, images_attributes: [:image, :_destroy, :id], category_ids: []).merge(user_id: 1)
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
