Rails.application.routes.draw do

  get 'reliefs/new'

  get 'reliefs/index'

  get 'relief/Stocklist'

  get 'relief/StockRegist'
  get 'guidelines/news'
  get 'relief/stock'
  get 'relief/information'
  get 'relief/list'

  root 'welcome#index'

  get    'signup', to: 'users#new'
  get 'relief/rist', to: 'relief#rist'
  get 'relief/information', to: 'relief#information'
  get 'relief/stock', to: 'relief#stock'
  get    'login' , to: 'sessions#new'
  get 'ranking/have', to: 'ranking#have' 
  get 'ranking/want', to: 'ranking#want' 
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :ownerships, only: [:create, :destroy]
  resources :items , only: [:new , :show]
  resources :reliefs, only: [:new, :create, :destroy]
end
