Rails.application.routes.draw do
  require Rails.root.join("lib", "subdomain.rb")
  constraints Subdomain do
    get    "/"                    => "organisations#index", as: :organisations
    get    "/organisations/"      => "organisations#show", as: :organisation
    get    "/hondanas"            => "hondanas#index", as: :hondanas
    post   "/hondanas"            => "hondanas#create"
    get    "/hondanas/new"        => "hondanas#new", as: :new_hondana
    get    "/hondanas/:id/edit"   => "hondanas#edit", as: :edit_hondana
    get    "/hondanas/:id"        => "hondanas#show", as: :hondana
    patch  "/hondanas/:id"        => "hondanas#update"
    delete "/hondanas/:id"        => "hondanas#destroy"
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
