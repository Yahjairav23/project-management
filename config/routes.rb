Rails.application.routes.draw do
resources :users, only: [:show, :new, :create, :edit, :update]
resources :teams, only: [:show]
resources :tasks, only: [:show]
resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
