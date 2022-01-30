Rails.application.routes.draw do


  root 'homes#top'
  resource :user, only: [:new, :create, :show, :edit, :update]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  get 'maps', to: "maps#index"
  get '/map_request', to: 'maps#map', as: 'map_request'
  resources :post_images
end
