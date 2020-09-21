Rails.application.routes.draw do
  root to: 'campanies#index'
  devise_for :campanies
  resources :campanies
  
end
