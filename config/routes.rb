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
  post   :login,        to: 'sessions#create'
  delete :logout,       to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :drinks
  resources :relationships, only: [:create, :destroy]
end
