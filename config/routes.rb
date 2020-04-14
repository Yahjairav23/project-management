Rails.application.routes.draw do
resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
resources :teams, only: [:show, :new, :create, :edit, :update, :destroy]
resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]
resources :projects
  
get "/", to: "application#home"

end
