Rails.application.routes.draw do
  root to: "main#index"

  get "about", to: "about#index"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  delete "logout", to: "sessions#destroy"

  resources :twitter_accounts
  resources :tweets
end
