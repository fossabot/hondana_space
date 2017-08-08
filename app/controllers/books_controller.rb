class BooksController < ApplicationController
  def show
    @book = Book.find_by!(isbn: params[:isbn])
    collection = Collection.find_by(book_id: @book.id, organisation_id: organisation.id)
    @hondana = collection.try(:hondana)
  end
end
