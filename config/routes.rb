Rails.application.routes.draw do

  get 'actors/new.:id', to: "actors#new", as: "actors_new"
  # get 'actors/index'
  # get 'actors/show'
  # get 'actors/edit'
  post 'actors/new/:id', to: "actors#create"
  resources :movies
  devise_for :users, controllers: { registrations: 'users/registrations',
                                          sessions: 'users/sessions', unlocks: 'users/unlocks',
                                          passwords: 'users/passwords', confirmations: 'users/confirmations'}
  root to: "home#index"
end