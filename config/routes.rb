Rails.application.routes.draw do
  devise_for :users
  
  root 'users#index'
  namespace :api, defaults: { format: :json } do
    resources :users, only: %i[create update destroy] do
      resources :posts, only: [:index, :show] do
        resources :comments, only: [:index, :create]
    end
   end
  end

    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :create, :new] do
        resources :comments, only: [:create, :new] 
        resources :likes, only: [:create]
      end
    end
end
