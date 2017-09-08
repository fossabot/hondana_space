Rails.application.routes.draw do
  root   "statics#home"
  get    "/books"            => "books#index", as: :books
  get    "/books/new"        => "books#new", as: :new_book
  post   "/books"            => "books#create"
  get    "/books/search"     => "books/search#new", as: :new_search_books
  post   "/books/search"     => "books/search#create", as: :search_books
  get    "/books/:isbn"      => "books#show", as: :book
end
