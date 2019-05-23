Rails.application.routes.draw do

  resources :items
  resources :agreements
  resources :services
  resources :inventaries
  resources :addresses
  resources :stores
  resources :statuses
  resources :providers
  resources :orders
  resources :roles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'pages#home'
end

