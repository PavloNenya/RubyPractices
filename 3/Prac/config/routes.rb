Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  resources :orders
  resources :comments
  resources :posters
  resources :services
  resources :accounts

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root 'pages#home', as: 'home'
  # Defines the root path route ("/")
  # root "posts#index"
end