Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products, only: [:new, :show]
  resources :users, only: [:new, :create, :show]
end