Rails.application.routes.draw do
  root   "books#index"
  get    "/books"            => "books#index", as: :books
  get    "/books/new"        => "books#new", as: :new_book
  post   "/books"            => "books#create"
  patch  "/books/:isbn"      => "books#update"
  post   "/books/search"     => "books/search#create", as: :search_books
  get    "/books/:isbn"      => "books#show", as: :book
end
