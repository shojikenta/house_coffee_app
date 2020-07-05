Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/show'
  get 'users/index'
  root 'static_pages#home'
  get    :about,        to: 'static_pages#about'
  get    :use_of_terms, to: 'static_pages#terms'
  get    :signup,       to: 'users#new'
  get    :login,        to: 'sessions#new'
  get    :favorites,    to: 'favorites#index'
  post   :login,        to: 'sessions#create'
  delete :logout,       to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :drinks
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  post   "favorites/:drink_id/create"  => "favorites#create"
  delete "favorites/:drink_id/destroy" => "favorites#destroy"
end
