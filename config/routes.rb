Rails.application.routes.draw do
  devise_for :users
  root to: "costumes#index"

  resources :costumes, except: [:new] do
    collection do
      get "mycostumes"
    end
    resources :bookings, only: [:create]
  end
end
