Rails.application.routes.draw do
  get 'ranks/index'
  get 'ranks/new'
  get 'ranks/create'
  get 'ranks/show'
  get 'ranks/edit'
  get 'ranks/update'
  get 'ranks/destory'
  root to: 'companies#index'
  devise_for :companies
  resources :companies
  
end
