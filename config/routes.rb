Rails.application.routes.draw do
  # get 'relationships/create'
  # get 'relationships/destroy'
  # get 'comments/create'
  # get 'comments/destroy'
  root to: 'users#home'
  devise_for :users

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  resources :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
