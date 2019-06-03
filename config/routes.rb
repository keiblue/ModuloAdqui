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
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'pages#home'

  get 'accounts', action: :index, controller: 'accounts', as: 'users'
  get 'accounts/new', action: :new, controller: 'accounts', as: 'new_user'
  get 'accounts/:id', action: :show, controller: 'accounts', as: 'user'
  get 'accounts/:id/edit', action: :edit, controller: 'accounts', as: 'edit_user'
  post 'accounts', action: :create, controller: 'accounts'
  patch 'accounts/:id', action: :update, controller: 'accounts'
  delete 'accounts/:id', action: :destroy, controller: 'accounts'

  get 'provider/items/:provider_id', action: :index, controller: 'items', as:'items_provider'
  get 'provider/items/new/:provider_id', action: :new, controller: 'items', as:'new_item_provider'
  get 'provider/items/:id/:provider_id', action: :show, controller: 'items', as:'item_provider'
  get 'provider/items/:id/edit/:provider_id', action: :edit, controller: 'items', as:'edit_item_provider'
  delete 'provider/items/:id/:provider_id', action: :destroy, controller: 'items', as: 'delete_item_provider'

end

