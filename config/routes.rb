Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  # get "my_profile", to: "pages#my_profile"
  root to: "pages#landing_page"
  get "home", to: "pages#home"
  get "my_profile", to: "pages#my_profile"
  resources :facilities, only: [ :index, :show, :new, :create ] do
    resources :reviews, only:  [ :create, :new ]
    resources :favourites, only: :create
    resources :routes, only: [ :show, :create ]
  end
  resources :favourites, only: [ :index, :update ]
  resources :blogs, only: [ :index, :show,]
end
