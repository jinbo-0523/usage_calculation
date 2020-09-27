Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/new'
  get 'foods/create'
  get 'foods/edit'
  get 'foods/update'
  get 'foods/destroy'
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  resources :ranks
  resources :users
  resources :brands
  resources :shops
end
