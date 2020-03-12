class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    # @image = @product.images.build
    # # 5.times { @product.images.build }
    # @sizes = Size.all
    # @conditions = Condition.all
    # @sending_methods = SendingMethod.all
    # @cat_parent = Category.where('ancestry IS NULL')
    # @cat_child = []
    # @cat_grand_child = []
  end
  def create
    @product = Product.create(product_params)
  end

  def show
    @product = Product.find(params[:id])
    @prefecture = Prefecture.find(@product.prefecture)
  end

  private

    def brand_check(brand_name)
      brand_id = ""
      if brand_name.present?
        brand_reg = "^#{brand_name}$"
        reg = Regexp.new(brand_reg)
        @brands = Brand.all
        @brands.each do |brand|
          if brand[:name].match(reg)
            brand_id = brand[:id]
          end
        end
      end
      return brand_id
    end

    def product_params
      params[:product][:brand_id] = brand_check(params[:product][:brand_id])
      params.require(:product).permit(:name, :category_id, :brand_id, :price, :description, :condition_id, :postage_burden, :sending_method_id, :scheduled_sending_date, :size_id, images_attributes: {image_url: []}).merge(seller_id: 1, status: 0, payment_method: 0, payment_status: 0, sending_status: 0, recieving_status: 0)
    end

end
