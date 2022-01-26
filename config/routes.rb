Rails.application.routes.draw do

  
  root 'homes#top'
  resource :user, only: [:new, :create, :show]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

end
