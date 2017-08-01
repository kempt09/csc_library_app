Rails.application.routes.draw do
  post 'checkout' => 'utilities#checkout'
  post 'checkin' => 'utilities#checkin'
  post 'token' => 'utilities#token'
  post 'send_password' => 'utilities#send_password'
  get 'inventory' => 'utilities#inventory'
  get 'search_user' => 'search#search_user'
  get 'search_book' => 'search#search_book'
  get 'search_inventory' => 'search#search_inventory'
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
