Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Defines the root path route ("/")
  # root "articles#index"

  resources :spaceships, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: [:show]
end
