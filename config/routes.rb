Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :rooms, only: [:show, :create]
  resources :messages, only: :create
  resources :notifications, only: [:index]

  root "rooms#index"
end
