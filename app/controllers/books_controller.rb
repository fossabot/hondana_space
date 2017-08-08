class BooksController < ApplicationController
  def show
    @book = Book.find_by!(isbn: params[:isbn])
    @hondana = @book.hondanas.find_by(organisation_id: organisation.id)
  end
end
