Rails.application.routes.draw do
  root   "home#index"
  get    "/oauth/callback"  => "oauths#callback"
  get    "/oauth/:provider" => "oauths#oauth", as: :auth_at_provider
  post   "/logout"          => "oauths#destroy", as: :logout
end
