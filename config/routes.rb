Rails.application.routes.draw do
  devise_for :users
  root "products#index"


  resources :products, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :new, :create] do
    resources :credit_cards, only: [:new, :create]
  end
  
  resources :categories, only: [:index, :show]

end