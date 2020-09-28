Rails.application.routes.draw do
  root to: 'companies#index'
  devise_for :companies
  resources :companies, only: :index
  resources :ranks, except: [:inde, :show]
  resources :users, except: [:inde, :show]
  resources :brands, except: [:inde, :show]
  resources :shops, except: [:inde, :show]
  resources :foods, except: [:inde, :show]
end