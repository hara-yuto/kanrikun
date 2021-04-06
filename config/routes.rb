Rails.application.routes.draw do
  devise_for :users
  get 'events/index'
  post 'events/index'
  
  root to: 'events#index'
  resources :events
  resources :users
end
