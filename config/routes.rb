Rails.application.routes.draw do
  get "/users" => "users#index"
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/events" => "events#index"
  get "/events/:id" => "events#show"

  post "/registrations" => "registrations#create"

end
