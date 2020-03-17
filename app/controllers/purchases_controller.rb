class PurchasesController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_product

  def done
    Payjp.api_key = Rails.application.credentials[:payjp][:private_key]
    Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
    @product.delivery_status = 1
    @product.save
  end

  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end