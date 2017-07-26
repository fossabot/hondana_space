Rails.application.routes.draw do
  require Rails.root.join("lib", "subdomain.rb")
  constraints Subdomain do
    get    "/"       => "organisations#show"
  end
  root   "home#index"
  post   "/organisations"         => "organisations#create"
  get    "/organisations/new"     => "organisations#new"
  get    "/oauth/callback"        => "oauths#callback"
  get    "/oauth/:provider"       => "oauths#oauth", as: :auth_at_provider
  post   "/logout"                => "oauths#destroy", as: :logout
end
