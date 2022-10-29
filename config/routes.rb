Rails.application.routes.draw do
  resources :products
  resources :clients
  resources :companies
  get 'home/index'

  devise_for :users, controllers: { invitations: 'users/invitations' }

  authenticated :user do
    root to: 'home#index', as: :user_authenticated
  end

  unauthenticated :user do
    root to: 'landing#index'
  end

end
