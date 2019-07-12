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
  #resources :accounts
  devise_for :users, :skip => [:registrations] 
   as :user do
     get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
     put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'pages#home'

  get 'accounts', action: :index, controller: 'accounts', as: 'users'
  get 'accounts/new', action: :new, controller: 'accounts', as: 'new_user'
  get 'accounts/:id', action: :show, controller: 'accounts', as: 'user'
  get 'accounts/:id/edit', action: :edit, controller: 'accounts', as: 'edit_user'
  post 'accounts', action: :create, controller: 'accounts'
  patch 'accounts/:id', action: :update, controller: 'accounts'
  delete 'accounts/:id', action: :destroy, controller: 'accounts'

  get 'provider/:provider_id/items/', action: :index, controller: 'items', as:'items_provider'
  post 'provider/:id/items/', action: :get_items, controller: 'providers'
  get 'provider/:provider_id/items/new/', action: :new, controller: 'items', as:'new_item_provider'
  get 'provider/:provider_id/items/:id/', action: :show, controller: 'items', as:'item_provider'
  get 'provider/:provider_id/items/:id/edit/', action: :edit, controller: 'items', as:'edit_item_provider'
  delete 'provider/:provider_id/items/:id/', action: :destroy, controller: 'items', as: 'delete_item_provider'

end
