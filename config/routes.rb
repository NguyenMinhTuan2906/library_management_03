Rails.application.routes.draw do
  root "pages#index"
  get "pages/help", to: "pages#help"
  get "/pages/:page", to: "pages#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :books
  resources :authors, only: :show

  namespace :admin do
    root "homes#index"
    resources :users
    resources :authors
    resources :books
    resources :publishers
    resources :categories
  end
end
