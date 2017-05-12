Rails.application.routes.draw do
  root 'articles#welcome'
  devise_for :users
  devise_for :installs
  # IF installs is not needed, you can also remove it here
  resources :cars
  # root to: 'article#index'

      resources :articles do
        resources :comments
    end
  end
