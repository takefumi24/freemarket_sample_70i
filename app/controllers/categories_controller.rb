class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @main_categories = Category.where(id: 1)
  end
  def show
    @category = Category.find(params[:id])
    @children = @category.children
    @parent = @children.parent
    @parent = @category.parent
    # さらに親要素を持つならそれを代入
    if @parent
      @parent = @parent.parent.present? ? @parent.parent : @parent
    end
  end
end
