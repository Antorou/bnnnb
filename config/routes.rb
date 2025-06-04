Rails.application.routes.draw do
  devise_for :users

  resources :rooms do
    resources :bookings, only: [:new, :create]
  end

  root "home#index"

  get 'dashboard', to: 'users#dashboard', as: 'user_dashboard'
end