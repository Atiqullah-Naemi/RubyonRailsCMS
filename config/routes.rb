Rails.application.routes.draw do


  root "homes#show"
  get "/admin" => "admin/dashboard#index"

  devise_for :users

  resources :posts, only: [:index, :show]
  resources :pages , only: [:index, :show]

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :settings, only: [:new, :create, :edit, :update]
    resources :homes, only: [:new, :create, :edit, :update]
    resources :posts
    resources :pages, except: [:show]
    resources :categories
    resources :tags
    resources :users, only: [:index, :destroy]
    resources :comments, only: [:index, :update, :destroy]
  end


end
