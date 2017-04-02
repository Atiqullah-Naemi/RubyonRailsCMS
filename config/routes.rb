Rails.application.routes.draw do


  namespace :admin do
    get 'settings/new'
  end

  namespace :admin do
    get 'settings/create'
  end

  namespace :admin do
    get 'settings/edit'
  end

  namespace :admin do
    get 'settings/update'
  end

  devise_for :users
  root "posts#index"

  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :posts
    resources :categories
  end


end
