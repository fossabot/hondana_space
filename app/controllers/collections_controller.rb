class CollectionsController < ApplicationController
  def index
    @collections = Collection.includes(:book).where(organisation_id: organisation.id)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.find_or_create_by_isbn(book_params[:isbn])
    @collection = Collection.find_or_initialize_by(organisation_id: organisation.id, book_id: @book.id)

    if @collection.save
      render "books/show", status: :created, location: @book
    else
      render json: @collection.errors.full_messages.first, status: :unprocessable_entity
    end
  rescue => e
    logger.error(e)
    render json: "We had trouble registering your book. Please try again later.", status: :unprocessable_entity
  end


  private
    def book_params
      params.require(:book).permit(:isbn)
    end
end
