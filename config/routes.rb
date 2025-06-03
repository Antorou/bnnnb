Rails.application.routes.draw do
  devise_for :users

  resources :rooms do
    resources :bookings, only: [:new, :create]
  end

  root "home#index"
end