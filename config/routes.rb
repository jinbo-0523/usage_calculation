Rails.application.routes.draw do
  get 'repors/index'
  get 'repors/new'
  get 'repors/create'
  get 'repors/show'
  get 'repors/edit'
  get 'repors/update'
  get 'repors/destroy'
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  resources :ranks, except: [:index, :show]
  resources :users, except: [:index, :show]
  resources :brands, except: [:index, :show]
  resources :shops, except: [:index, :show]
  resources :foods, except: [:index, :show]
  namespace :recipes do
    resources :search, only: :index, defaults: { format: :json }
  end
  resources :recipes
end