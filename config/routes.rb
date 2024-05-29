Rails.application.routes.draw do
  devise_for :users
  #root to: "costumes#index"
  root to: "pages#home"

  resources :costumes, except: [:new] do
    resources :bookings, only: [:create]
  end
end
