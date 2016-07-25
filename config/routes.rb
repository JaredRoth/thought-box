Rails.application.routes.draw do
  root "links#index"

  get "/signin", to: "sessions#index"
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :users, only: [:create, :new]
end
