Rails.application.routes.draw do
  resources :cars
  # root to: 'article#index'

      resources :articles do
        resources :comments
    end
  end
