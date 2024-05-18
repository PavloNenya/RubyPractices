Rails.application.routes.draw do
  resources :votes
  resources :chose_ps
  resources :chose_us
  resources :payments
  resources :reviews
  resources :favorites
  resources :posters
  resources :profiles
  resources :services
  devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
  get 'home/index'

  get 'home/search', to: 'home#search', as: 'home_search'
  resources :posters do
    member do
      post 'add_to_favorites'
    end
  end

  resources :posters do
    resources :reviews, only: [:new, :create]
  end

  resources :posters do
    member do
      get 'schedule'
      get 'check_busy_day'
    end
  end
  resources :payments do
    post 'check_busy_day', on: :collection
  end
  resources :posters do
    delete 'clear_picture', on: :member
  end
  resources :profiles do
    delete 'clear_avatar', on: :member
  end
end
