Rails.application.routes.draw do
  get 'seasons/index'
  get 'seasons/show'
  get 'seasons/create'
  get 'seasons/update'
  get 'seasons/delete'
  get 'matches/index'
  get 'matches/show'
  get 'matches/create'
  get 'matches/update'
  get 'matches/delete'
  get 'players/index'
  get 'players/show'
  get 'players/create'
  get 'players/update'
  get 'players/delete'
  get 'teams/index'
  get 'teams/show'
  get 'teams/create'
  get 'teams/update'
  get 'teams/delete'
  devise_for :users
  resources :teams
  root to: "pages#home"
  resources :teams do
    member do
      patch 'update_players', to: 'teams#update_players'
    end
  end
  resources :matches, only: [:index, :create, :show]
  resources :matches do
    post 'simulate', on: :member
  end

  # Redireciona para a página teams/index após efetuar o login
  authenticated :user do
    root to: 'teams#index', as: :authenticated_root
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
