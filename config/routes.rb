Rails.application.routes.draw do

  # resources :accounts
  resources :payments
  resources :items
  resources :agreements
  resources :services
  resources :addresses
  resources :stores
  resources :statuses
  resources :providers
  resources :orders
  resources :roles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'pages#home'

  get 'accounts', action: :index, controller: 'accounts', as: 'users'
  get 'accounts/new', action: :new, controller: 'accounts', as: 'new_user'
  get 'accounts/:id', action: :new, controller: 'accounts', as: 'user'
  get 'accounts/:id/edit', action: :new, controller: 'accounts', as: 'edit_user'
  post 'accounts', action: :create, controller: 'accounts'

end

