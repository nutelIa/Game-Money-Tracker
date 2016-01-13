Rails.application.routes.draw do
  root to: 'home#index'
  post 'change', to: 'players', as: :change
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  resources :users
  get 'games/new', to: 'games#new'
  resources :games do
  	resources :players
  end
end
