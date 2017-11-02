Rails.application.routes.draw do
  resources :customers
  post 'token' => 'application#token'

  namespace :utilities do
    post :checkout
    post :checkin
  end

  namespace :search do
    get :customers
    get :books
    get :authors
  end

  resources :publishers
  resources :authors
  resources :circulations

  resources :log_entries
  resources :users
  resources :addresses

end
