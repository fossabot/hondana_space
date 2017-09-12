class BooksController < ApplicationController

  def index
    @books = Book.all.limit(30).order(created_at: :desc)
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
      redirect_to book_path(@book.isbn), success: "Book was successfully created."
    end
  rescue => e
    logger.error(e)
    render "books/new", danger: "We had trouble registering the book. Please try again later."
  end

  def update
    @book = Book.update_by_isbn(params[:isbn])
    if @book.save!
      redirect_to book_path(@book.isbn), success: "Book was successfully updated."
    end
  rescue => e
    logger.error(e)
    redirect_to book_path(params[:isbn]), danger: "We had trouble updating the book. Please try again later."
  end

  private

    def book_params
      params.require(:book).permit(:isbn)
    end
end
