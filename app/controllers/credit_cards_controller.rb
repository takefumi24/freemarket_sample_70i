class CreditCardsController < ApplicationController

  require "payjp"

  def new
    if user_signed_in?
      @card = CreditCard.new
      card = CreditCard.where(user_id: current_user.id)
      redirect_to user_path(current_user.id) if card.exists?
    else
      redirect_to new_user_session_path
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials[:payjp][:private_key]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to user_path(current_user.id)
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:private_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

end