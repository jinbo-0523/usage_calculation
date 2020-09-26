Rails.application.routes.draw do
  get 'shops/index'
  get 'shops/new'
  get 'shops/create'
  get 'shops/edit'
  get 'shops/update'
  get 'shops/destroy'
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  resources :ranks
  resources :users
  resources :brands
end
