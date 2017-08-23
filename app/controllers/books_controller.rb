class BooksController < ApplicationController
  def show
    @book = Book.find_by!(isbn: params[:isbn])
    @property = @book.property_of(organisation)
  end
end
