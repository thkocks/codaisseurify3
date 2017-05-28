Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show]
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :albums
  resources :artist
end
