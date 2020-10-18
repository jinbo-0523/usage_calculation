Rails.application.routes.draw do
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  resources :ranks
  resources :users
  resources :brands
  resources :shops
  resources :foods
  namespace :recipes do
    resources :search, only: :index, defaults: { format: :json }
  end
  resources :recipes  
  resources :reports, except: :destroy
end