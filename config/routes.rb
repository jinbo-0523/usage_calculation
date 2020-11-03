Rails.application.routes.draw do
  root to: 'companies#index'
  devise_for :companies, controllers: {
    registrations: 'companies/registrations'
  }
  devise_scope :company do
    post 'companies/guest_sign_in', to: 'companies/sessions#new_guest'
  end
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