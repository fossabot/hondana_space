class CollectionsController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.find_or_create_by_isbn(book_params[:isbn].gsub("-", ""))
    hondana = Hondana.where(organisation_id: organisation.id).first
    @collection = Collection.find_or_initialize_by(hondana_id: hondana.id, book_id: @book.id)

    if @collection.save
      render "books/show", status: :created, location: @book
    else
      render json: @collection.errors.full_messages.first, status: :unprocessable_entity
    end
  end


  private
    def book_params
      params.require(:book).permit(:isbn)
    end
end
