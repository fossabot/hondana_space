class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV["BASIC_AUTH_USERNAME"], password: ENV["BASIC_AUTH_PASSWORD"] if Rails.env.production?

  before_action :set_search_book

  def set_search_book
    @search_book = Search::Book.new
  end
end
