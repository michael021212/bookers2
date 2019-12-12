Rails.application.routes.draw do
  root to: 'users#home'
  # get 'users/show'
  devise_for :users
  resources :users
  resources :books
  resources :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
