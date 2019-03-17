Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  get 'rankings/have', to: 'rankings#have'
  get 'wantrankings/want', to: 'wantrankings#want'
  
  resources :users, only: [:show, :new, :create]

  resources :items, only: [:show, :new]
  resources :ownerships, only: [:create, :destroy]
  resources :hoshiis, only: [:create, :destroy]
  
end