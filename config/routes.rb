Rails.application.routes.draw do
  
  root to: 'application#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'  
  
  resources :companies
  resources :subscriptions
  
  resources :users do
    resources :subscriptions 
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
