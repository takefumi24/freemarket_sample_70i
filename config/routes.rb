Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'buy'
    end
  end

  resources :users, only: [:show, :new, :create]

  resources :categories, only: [:index, :show]

end