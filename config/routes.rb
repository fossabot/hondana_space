Rails.application.routes.draw do
  require Rails.root.join("lib", "subdomain.rb")
  constraints Subdomain do
    get    "/"                    => "collections#index"
    get    "/organisations/"      => "organisations#show", as: :organisation
    get    "/collections"         => "collections#index", as: :collections
    post   "/collections"         => "collections#create"
    get    "/collections/new"     => "collections#new", as: :new_collection
    get    "/books/:isbn"         => "books#show", as: :book
  end
  root   "home#index"
  post   "/organisations"         => "organisations#create"
  get    "/oauth/callback"        => "oauths#callback"
  get    "/oauth/:provider"       => "oauths#oauth", as: :auth_at_provider
  post   "/logout"                => "oauths#destroy", as: :logout
end
