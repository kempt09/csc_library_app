Rails.application.routes.draw do
  post 'checkout' => 'utilities#checkout'
  post 'checkin' => 'utilities#checkin'
  post 'token' => 'utilities#token'
  post 'send_password' => 'utilities#send_password'
  get 'history' => 'utilities#history'
  get 'inventory' => 'utilities#inventory'
  # get 'seed' => 'application#seed'
  resources :publishers
  resources :references
  resources :periodicals
  resources :authors
  resources :circulations
  resources :holdings
  resources :log_entries
  resources :community_users
  resources :addresses
  resources :staffs
  resources :students
  resources :users
end
