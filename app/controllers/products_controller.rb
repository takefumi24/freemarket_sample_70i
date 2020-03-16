class ProductsController < ApplicationController
  def index
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

    def product_params
      params.require(:product).permit(:name, :category_id, :brand_id, :price, :detail, :condition_id, :which_postage, :sending_method_id, :size_id, :prefecture, :shipping_date, images_attributes: [:image]).merge(user_id: 1)
    end

end
