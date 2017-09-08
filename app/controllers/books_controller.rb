class BooksController < ApplicationController

  def index
  end

  def show
    @book = Book.find_by!(isbn: params[:isbn])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.find_or_create_by_isbn(book_params[:isbn])
    if @book.save
      redirect_to book_path(@book.isbn), notice: "Book was successfully created."
    else
      render "books/new"
    end
  rescue => e
    logger.error(e)
    raise "We had trouble registering your book. Please try again later."
  end

  private

    def book_params
      params.require(:book).permit(:isbn)
    end
end
