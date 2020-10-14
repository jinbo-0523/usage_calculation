Rails.application.routes.draw do
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  resources :ranks, except: :show
  resources :users, except: :show
  resources :brands, except: :show
  resources :shops
  resources :foods, except: :show
  namespace :recipes do
    resources :search, only: :index, defaults: { format: :json }
  end
  resources :recipes, except: :show  
  resources :reports, except: :show
end