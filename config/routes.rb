Rails.application.routes.draw do
  devise_for :users
  root to: "spaceships#index"

  # Defines the root path route ("/")
  # root "articles#index"

  resources :spaceships, only: %i[show new create] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: [:show]
end
