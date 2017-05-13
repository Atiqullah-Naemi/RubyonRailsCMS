Rails.application.routes.draw do


  root "homes#show"
  get "/admin" => "admin/dashboard#index"
  #match 'users/:id' => 'admin/users#destroy', :via => :delete, :as => :admin_destroy_user

  devise_for :users

  resources :posts, only: [:index, :show] do 
    resources :comments, only: [:index, :show, :create]
  end
  resources :categories, only: [:show]
  resources :pages , only: [:show]

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :settings, only: [:new, :create, :edit, :update]
    resources :homes, only: [:new, :create, :edit, :update]
    resources :posts
    resources :pages, except: [:show]
    resources :categories
    resources :tags
    resources :users, only: [:index, :destroy]
    resources :comments, only: [:index, :destroy]
  end


end
