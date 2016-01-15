Rails.application.routes.draw do
  root to: 'home#index'
  post 'change', to: 'players', as: :change
  patch 'delete', to: 'home', as: :delete
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  resources :users
  get 'games/new', to: 'games#new'
  get 'home/about', to: 'home#about'
  resources :games do
  	resources :players
  end
end
