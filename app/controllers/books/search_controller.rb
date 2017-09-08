class Books::SearchController < ApplicationController
  def new
    @book = Search::Book.new
  end

  def create
    @book = Search::Book.new(search_params)
    @books = @book.matches
  end

  private
  def search_params
    params.require(:search_book).permit(Search::Book::ATTRIBUTES)
  end
end
