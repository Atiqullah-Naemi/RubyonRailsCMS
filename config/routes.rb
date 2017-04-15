Rails.application.routes.draw do

  root "posts#index"
  get "/admin" => "admin/dashboard#index"

  devise_for :users

  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :settings
    resources :posts
    resources :pages, except: [:show]
    resources :categories
    resources :tags
    resources :users, only: [:index, :destroy]
    resources :comments, only: [:index, :update, :destroy]
  end


end
