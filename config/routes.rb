Rails.application.routes.draw do
  root to: "main#index"

  get "about", to: "about#index"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  delete "logout", to: "sessions#destroy"
end
