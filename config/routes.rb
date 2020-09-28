Rails.application.routes.draw do
  root to: 'companies#index'
  devise_for :companies
  resources :companies, only: :index
  resources :ranks, except: [:index, :show]
  resources :users, except: [:index, :show]
  resources :brands, except: [:index, :show]
  resources :shops, except: [:index, :show]
  resources :foods, except: [:index, :show]
  resources :recipes
end