Rails.application.routes.draw do

  root "posts#index"
  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :posts
  end

end
