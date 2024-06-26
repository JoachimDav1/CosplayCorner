Rails.application.routes.draw do
  devise_for :users
  root to: "costumes#index"

  resources :costumes do
    collection do
      get "mycostumes"
    end
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index]

  get '/faq', to: 'pages#faq'
  get '/contact', to: 'pages#contact'
end
