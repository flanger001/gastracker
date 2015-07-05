Rails.application.routes.draw do

  root 'static_pages#index'
  get 'index', to: 'static_pages#index'
  get 'about', to: 'static_pages#about'

  get 'dashboard', to: 'gas_entries#dashboard'
  get 'instructions', to: 'gas_entries#instructions'
  get 'statistics', to: 'gas_entries#statistics'

  get 'login', to: 'sessions#new'
  match 'logout', to: 'sessions#destroy', via: [:get, :post]

  resources :users
  resources :passwords
  resources :sessions
  resources :gas_entries
  resources :stations

end
