# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  isbn         :string(255)      not null
#  title        :string(255)
#  author       :string(255)
#  manufacturer :string(255)
#  amazon_url   :string(255)
#  image_url    :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_books_on_isbn  (isbn) UNIQUE
#

class Book < ApplicationRecord
  has_many :collections
  has_many :hondanas, through: :collections

  def self.find_or_create_by_isbn(isbn)
    book = self.find_or_initialize_by(isbn: isbn)
    if book.new_record?
      client = Rapa::Client.new(
        access_key_id: ENV["AMAZON_ACCESS_KEY_ID"],
        secret_access_key: ENV["AMAZON_SECRET_ACCESS_KEY"],
        associate_tag: ENV["AMAZON_ASSOCIATE_TAG"],
      )
      response = client.search_items(
        domain: "co.jp",
        keywords: [isbn],
      )
      amazon_book = response.first
      book.isbn = isbn
      book.title = amazon_book.title
      book.author = amazon_book.authors.join(", ")
      book.manufacturer = amazon_book.manufacturer
      book.amazon_url = URI.decode(amazon_book.url_details_page)
      book.image_url = amazon_book.image_thumbnail
      book.save
    end
    book
  end
end
