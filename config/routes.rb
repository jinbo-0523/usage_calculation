Rails.application.routes.draw do
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  resources :ranks
  resources :users
  resources :brands
  resources :shops
end
