Rails.application.routes.draw do
  get 'items/index'
  get 'items/new'
  root to: 'items#index'
  resources :items do
    resources :buyers, only: [:index, :create]
  end
  devise_for :users
end
