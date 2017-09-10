Rails.application.routes.draw do
  get "/" => "users#new"

  get "/users" => "users#index"
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/events" => "events#index"
  get "/events/:id" => "events#show"
  get "/races" => "events#races"

  post "/registrations" => "registrations#create"
  get "/registrations/:id/edit" => "registrations#edit"
  patch "/registrations/:id" => "registrations#update"

  get "/reports" => "reports#index"
  get "/reports/new" => "reports#new"
  post "/reports" => "reports#create"
  get "/reports/:id" => "reports#show"
  get "/reports/:id/edit" => "reports#edit"
  patch "/reports/:id" => "reports#update"
  delete "/reports/:id" => "reports#destroy"

  get "/results" => "results#index"
  get "/results/:id" => "results#show"

  namespace :api do
    get "/events" => "events#index"
    get "/events/:id" => "events#show"
  end

end
