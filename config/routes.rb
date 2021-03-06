Rails.application.routes.draw do
  
  resources :messages
  resources :conversations
  resources :users

  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
