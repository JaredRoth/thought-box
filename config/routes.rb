Rails.application.routes.draw do
  root "links#index"

  get "/signin", to: "sessions#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :users, only: [:create, :new]
  resources :links, only: [:create, :update, :edit]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
