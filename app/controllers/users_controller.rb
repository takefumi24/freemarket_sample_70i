class UsersController < ApplicationController
  include CommonActions
  before_action :set_categories
  
  def show
    @user = current_user
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:private_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  
end

