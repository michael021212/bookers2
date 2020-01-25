Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  root to: 'users#home'
  devise_for :users
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  resources :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
