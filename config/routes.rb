Rails.application.routes.draw do

<<<<<<< HEAD
  resources :logins
=======
  resources :payments
>>>>>>> e59bf30f391990ef37c8a780e8e2e9a052006ccf
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

  get 'user_new', action: :index, controller: 'login'

end

