Rails.application.routes.draw do
  
  
  root "home#index"

  get "/about", to: "aboute#index"
  get "/contact", to: "contact#index"

  get "/login", to:  "sessions#new"
  post "/login", to:  "sessions#create"
  delete "/logout", to:  "sessions#destroy"

  resources :offers, only: [:new, :create, :destroy]

  get "/list/:id", to: "interesteds#index", as: "list"

  get "/interesteds/:id", to: "interesteds#create", as: "interesteds"
  delete "/interested/:id", to: "interesteds#destroy", as: "interested"

  resources :userjobs, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  	member do 
  		get "confirm"
  	end
  end
  
  resources :userservices, only: [:new, :create, :show, :edit, :update, :destroy] do
  	member do 
  		get "confirm"
  	end
  end

end
