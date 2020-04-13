Rails.application.routes.draw do
  get 'teams/show'
  get 'teams/index'
  get 'teams/new'
  get 'teams/edit'
  get 'projects/index'
  get 'projects/show'
  get 'projects/new'
  get 'projects/edit'
  get 'tasks/show'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
