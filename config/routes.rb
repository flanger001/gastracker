Rails.application.routes.draw do
  root 'pages#index'
  get 'index', to: 'pages#index'
  get 'about', to: 'pages#about'

  get 'login', to: 'sessions#new'
  match 'logout', to: 'sessions#destroy', via: [:get, :post]

  resources :users
  resources :passwords
  resources :sessions
  resources :gas_entries
  controller :gas_entries do
    get 'instructions' => :instructions
    get 'statistics' => :statistics
  end
  resources :dashboards, path: 'dashboard', only: :index
  resources :stations
  resources :vehicles, module: 'vehicle' do
    resources :gas_entries
    member do
      resources :gas_entries
      resources :statistics, only: :index
    end
  end
end
