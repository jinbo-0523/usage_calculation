Rails.application.routes.draw do
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  resources :ranks, except: :destroy
  resources :users, except: :destroy
  resources :brands
  resources :shops
  resources :foods, except: :destroy
  namespace :recipes do
    resources :search, only: :index, defaults: { format: :json }
  end
  resources :recipes  
  resources :reports, except: :destroy
end