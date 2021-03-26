Rails.application.routes.draw do
  resources :loans
  resources :users
  resources :authors
  resources :books
  root "books#index"
end
