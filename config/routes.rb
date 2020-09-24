Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destory'
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  resources :ranks
  
end
