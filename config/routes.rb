Rails.application.routes.draw do
  root 'homes#top'
  get 'about', to: "homes#about"
  resource :user, only: [:new, :create, :show, :edit, :update]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  get 'users/unsubscribe'
  patch 'users/update'
  patch 'users/withdraw'

  def active_for_authentication?
    super && (is_deleted == false)
  end

  get 'maps', to: "maps#index"
  get '/map_request', to: 'maps#map', as: 'map_request'
  resources :post_images do
    resources :post_comments, only: [:create, :destroy]
  end
end
