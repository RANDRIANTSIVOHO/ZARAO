Rails.application.routes.draw do
  
  root "home#index"

  get "/login", to:  "sessions#new"
  post "/login", to:  "sessions#create"
  delete "/logout", to:  "sessions#destroy"
  
  resources :userjobs, only: [:new, :create, :show, :edit, :update, :destroy]
  
  resources :userservices, only: [:new, :create, :show, :edit, :update, :destroy]

end
