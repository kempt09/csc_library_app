Rails.application.routes.draw do
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
