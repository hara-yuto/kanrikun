Rails.application.routes.draw do
  get 'events/index'
  
  root to: 'events#index'
  resources :events
end
