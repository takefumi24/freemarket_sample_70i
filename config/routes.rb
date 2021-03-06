Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'users/registrations' }
    get "users/show" => "users#show"

  root "products#index"
  resources :products, only: [:new, :create, :show, :edit, :update, :destroy] do
    resource :product_users, only:[:create, :destroy]
    member do
      get 'buy'
    end
    resources :purchases, only: [] do
      member do
        get 'done', to: 'purchases#done'
      end
    end
  end

  resources :users, only: [:show, :new, :create]

  resources :credit_cards, only: [:new] do
    collection do
      post 'pay', to: 'credit_cards#pay'
      delete 'delete', to: 'credit_cards#delete'
    end
  end

  resources :category, controller: :categories, only: [:index, :show]
end
