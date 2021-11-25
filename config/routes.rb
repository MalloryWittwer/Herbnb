Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  resources :mowers do
    resources :bookings, only: [:edit, :update, :new, :create]
  end

  resources :users, only: [:show, :edit, :update] # est-ce correct ?
end
