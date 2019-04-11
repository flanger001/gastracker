Rails.application.routes.draw do
  root "pages#index"
  get "about", to: "pages#about"

  get "login", to: "users/sessions#new"
  match "logout", to: "users/sessions#destroy", via: [:get, :post]

  scope module: :users do
    resource :user, path: "account"
    resource :password, only: [:new, :create]
    resource :session, only: [:new, :create, :destroy]
  end

  resource :dashboard, only: [:show]
  get "instructions", to: "dashboards#instructions"

  resources :stations
  resources :vehicles, module: "vehicles" do
    resources :gas_entries
  end
end
