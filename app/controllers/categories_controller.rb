class CategoriesController < ApplicationController
  include CommonActions
  before_action :set_categories

  def index
    @main_categories = Category.where(id: 1..13)
    respond_to do |format|
      format.html

      # jsonの場合カテゴリ一覧を3階層にして渡す
      @data = []
      none = "選択してください"
      @data << {id: 0, name: none, sub: [{id: 0, name: none, sub: [{id: 0, name: none}]}]}
      @main_categories.each_with_index do |cat, i|
        @data << {id: cat.id, name: cat.name}
        @data[i + 1][:sub] = [{id: 0, name: none, sub: [{id: 0, name: none}]}]
        cat.children.each_with_index do |child, j|
          @data[i + 1][:sub] << {id: child.id, name: child.name}
          @data[i + 1][:sub][j + 1][:sub] = [{id: 0, name: none}]
          child.children.each do |gchild|
            @data[i + 1][:sub][j + 1][:sub] << {id: gchild.id, name: gchild.name}
          end
        end
      end
      format.json {render json: @data }
    end
  end

  def show
    @category = Category.find(params[:id])
    @children = @category.children
    @parent = @category.parent
    # さらに親要素を持つならそれを代入
    if @parent
      @parent = @parent.parent.present? ? @parent.parent : @parent
    end

    # カテゴリー別商品一覧
    id = @category.id

    if id >= 153  # 孫カテゴリーの場合
      @products = @category.products.出品中
    elsif 14 <= id && id <= 152  # 親カテゴリーの場合
      @products = []
      @category.children.each do |category|
        product = category.products.出品中
        if product != []
          @products.concat(product)
        end
      end
    else  # ルートカテゴリーの場合
      @products = []
      @category.indirects.each do |category|
        product = category.products.出品中
        if product != []
          @products.concat(product)
        end
      end
    end

  end
end
