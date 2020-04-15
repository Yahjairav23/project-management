Rails.application.routes.draw do
resources :users, only: [:show, :new, :create, :edit, :update, :destroy] 
resources :teams, only: [:show, :new, :create, :edit, :update, :destroy]
resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy] do
    member do
        patch :completed
    end
end
resources :projects
resources :comments, only: [:show, :new, :create]
  
get "/", to: "users#home", as: "home"
get "/login", to: "sessions#login"
post "/login", to: "sessions#process_login"
get "/logout", to: "sessions#logout"

end
