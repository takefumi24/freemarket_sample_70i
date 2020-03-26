class ProductUsersController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    like = current_user.product_users.build(product_id: params[:product_id])
    if like.save
      respond_to do |format|
        format.html { redirect_to product_path(params[:product_id])}
        format.js
      end
    else
      redirect_to product_path(params[:product_id]), alert: 'お気に入り登録に失敗しました'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    like = ProductUser.find_by(product_id: params[:product_id], user_id: current_user.id)
    if like.destroy
      respond_to do |format|
        format.html { redirect_to product_path(params[:product_id])}
        format.js
      end
    else
      redirect_to product_path(params[:product_id]), alert: 'お気に入りの削除に失敗しました'
    end
  end
end