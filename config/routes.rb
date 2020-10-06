Rails.application.routes.draw do
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  resources :ranks, except: [:index, :show]
  resources :users, except: [:index, :show]
  resources :brands, except: [:index, :show]
  resources :shops, except: :index
  resources :foods, except: [:index, :show]
  namespace :recipes do
    resources :search, only: :index, defaults: { format: :json }
  end
  resources :recipes
  resources :reports
end