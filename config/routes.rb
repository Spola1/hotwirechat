Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "rooms#index"
  resources :rooms, only: [:show, :create, :new]
  resources :messages, only: :create
end
