Rails.application.routes.draw do
  resources :image_comments
  resources :images
  root 'static_pages#home'
  get 'user' => 'users#index'

  devise_for :users
  resources :images

  resources :users do
    member do
      get :following, :followers
    end
  end
resources :relationships,       only: [:create, :destroy]
   get '/user/:id' => 'users#show'
end
