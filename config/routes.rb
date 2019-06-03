Rails.application.routes.draw do

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
  resources :accounts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'pages#home'

  get 'accounts', action: :index, controller: 'accounts', as: 'users'
  get 'accounts/new', action: :new, controller: 'accounts', as: 'new_user'
  get 'accounts/:id', action: :show, controller: 'accounts', as: 'user'
  get 'accounts/:id/edit', action: :edit, controller: 'accounts', as: 'edit_user'
  post 'accounts', action: :create, controller: 'accounts'
  #patch 'accounts/:id', action: :update, controller: 'accounts'
  delete 'accounts/:id', action: :destroy, controller: 'accounts'

  get 'providers/:id/items', action: :items, controller: 'providers' , as: 'provider_items'
  get 'providers/:id/items/new', action: :new_item, controller: 'providers' , as: 'provider_new_item'
  post 'providers/:id/items', action: :create_item, controller: 'providers'
  delete 'providers/:id/items', action: :destroy_item, controller: 'providers', as: 'providers_item_delete'
end
