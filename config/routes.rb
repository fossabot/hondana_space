Rails.application.routes.draw do
  root   "statics#home"
  get    "/books"            => "books#index", as: :books
  get    "/books/new"        => "books#new", as: :new_book
  post   "/books"            => "books#create"
  get    "/books/:isbn"      => "books#show", as: :book
end
