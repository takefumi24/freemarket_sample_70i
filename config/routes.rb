Rails.application.routes.draw do
  get 'profiles/create'
  devise_for :users
  root "products#index"
  resources :products, only: [:new, :show]
  resources :users, only: [:new, :create, :show]
end