Rails.application.routes.draw do
  require Rails.root.join("lib", "subdomain.rb")
  constraints Subdomain do
    get    "/"                  => "organisations#show"
    get    "/hondanas"          => "hondanas#index", as: :hondanas
    post   "/hondanas"          => "hondanas#create"
    get    "/hondanas/new"      => "hondanas#new", as: :new_hondana
    get    "/hondanas/:id/edit" => "hondanas#edit", as: :edit_hondana
    get    "/hondanas/:id"      => "hondanas#show", as: :hondana
    patch  "/hondanas/:id"      => "hondanas#update"
    delete "/hondanas/:id"      => "hondanas#destroy"
  end
  root   "home#index"
  post   "/organisations"         => "organisations#create"
  get    "/organisations/new"     => "organisations#new"
  get    "/oauth/callback"        => "oauths#callback"
  get    "/oauth/:provider"       => "oauths#oauth", as: :auth_at_provider
  post   "/logout"                => "oauths#destroy", as: :logout
end
