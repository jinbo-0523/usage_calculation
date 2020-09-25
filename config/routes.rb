Rails.application.routes.draw do
  get 'brands/index'
  get 'brands/new'
  get 'brands/create'
  get 'brands/edit'
  get 'brands/update'
  get 'brands/destroy'
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  resources :ranks
  resources :users
  
end
