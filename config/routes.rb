Rails.application.routes.draw do
  resources :searches
  resources :image_comments
  root 'static_pages#home'
  get 'user' => 'users#index'


  devise_for :users

  resources :users do
    member do
      get :following, :followers
      get :live_search
    end
  end

get '/users/searches', to: 'searches#index'
  
resources :relationships,       only: [:create, :destroy]
get '/user/:id' => 'users#show'
  resources :images do
    resource :like
  end
  get '/user/:id' => 'users#show', as: 'showuser'
end

