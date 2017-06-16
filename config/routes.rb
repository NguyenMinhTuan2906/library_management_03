Rails.application.routes.draw do
  root "pages#index"
  get "pages/help", to: "pages#help"
  get "/pages/:page", to: "pages#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    resources :book_borrows, only: [:create, :destroy]
    member do
      get :following, :followers
    end
  end
  resources :books
  resources :authors, only: :show
  resources :relationships, only: [:create, :destroy]

  namespace :admin do
    root "book_borrows#index"
    resources :users
    resources :authors
    resources :books
    resources :publishers
    resources :categories
    resources :book_borrows, only: [:index, :update, :destroy]
  end
end
