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
    if @book.save!
      redirect_to book_path(@book.isbn), notice: "Book was successfully created."
    end
  rescue => e
    logger.error(e)
    render "books/new", notice: "We had trouble registering the book. Please try again later."
  end

  def update
    @book = Book.update_by_isbn(params[:isbn])
    if @book.save!
      redirect_to book_path(@book.isbn), notice: "Book was successfully updated."
    end
  rescue => e
    logger.error(e)
    redirect_to book_path(params[:isbn]), notice: "We had trouble updating the book. Please try again later."
  end

  private

    def book_params
      params.require(:book).permit(:isbn)
    end
end
