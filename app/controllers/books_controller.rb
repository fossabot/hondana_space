class BooksController < ApplicationController
  def show
    @book = Book.find_by!(isbn: params[:isbn])
    @property = @book.property_of(organisation)
  end

  def search
    return unless params[:q]
    @book = Book.find_by(isbn: ISBN.thirteen(isbn))
  end
end
