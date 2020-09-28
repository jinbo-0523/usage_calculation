Rails.application.routes.draw do
  root to: 'companies#index'
  devise_for :companies
  resources :companies, only: :index
  resources :ranks
  resources :users
  resources :brands
  resources :shops
  resources :foods
end
