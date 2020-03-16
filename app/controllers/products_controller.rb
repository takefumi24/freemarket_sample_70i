class ProductsController < ApplicationController
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
    @prefecture = Prefecture.find(@product.prefecture)
  end

  def edit
    # 編集機能実装用
    # @product = Product.find(params[:id])
  end

  def update
    # 編集機能実装用
    # product = Product.find(params[:id])
    # product.update(product_params)
    # redirect_to action: :show
  end

  def destroy
    # 削除機能実装用
    # product = Product.find(params[:id])
    # product.destroy
    # redirect_to root_path
  end

  def buy
  end 

    def product_params
      params.require(:product).permit(:name, :category_id, :brand_id, :price, :detail, :condition_id, :which_postage, :sending_method_id, :size_id, :prefecture, :shipping_date, images_attributes: [:image]).merge(user_id: 1)
    end 

end
