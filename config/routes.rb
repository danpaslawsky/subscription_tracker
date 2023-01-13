Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'  
  
  resources :users
  resources :companies
  resources :subscriptions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
