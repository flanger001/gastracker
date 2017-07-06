Rails.application.routes.draw do
  root 'pages#index'
  get 'about', to: 'pages#about'

  get '404', to: 'errors#not_found'
  get '500', to: 'errors#internal_server_error'

  get 'login', to: 'users/sessions#new'
  match 'logout', to: 'users/sessions#destroy', via: [:get, :post]

  scope module: :users do
    resource :user, path: 'account'
    resource :password, only: [:new, :create]
    resource :session, only: [:new, :create, :destroy]
  end

  resources :gas_entries

  resource :dashboard, only: [:show]
  get 'instructions', to: 'dashboards#instructions'

  resources :stations
  resources :vehicles, module: 'vehicles' do
    resources :gas_entries
  end
end
