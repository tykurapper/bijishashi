Rails.application.routes.draw do
  resources :image_comments
  root 'static_pages#home'
  get 'static_pages/home'


  devise_for :users
  resources :images do
    resource :like
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  get '/user/:id' => 'users#show', as: 'showuser'

end
