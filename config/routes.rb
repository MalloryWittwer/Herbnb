Rails.application.routes.draw do
  devise_for :users
  root to: 'mowers#index'
  resources :mowers do
    resources :bookings, only: [:edit, :update, :new, :create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] # est-ce correct ?
end
