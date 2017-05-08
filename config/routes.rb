Rails.application.routes.draw do
  resources :image_comments
  resources :images
  root 'static_pages#home'
  get 'static_pages/home'

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :images

  get '/user/:id' => 'users#show', as: 'showuser'

end
