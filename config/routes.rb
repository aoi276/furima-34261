Rails.application.routes.draw do
  get 'items/index'
  get 'items/new'
  root to: 'items#index'
  resources :items, only:[:index, :new, :creat, :show, :edit]
  devise_for :users
end
