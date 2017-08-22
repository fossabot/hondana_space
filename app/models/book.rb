# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  isbn       :string(255)      not null
#  title      :string(255)
#  author     :string(255)
#  publisher  :string(255)
#  category   :string(255)
#  amazon_url :string(255)
#  kindle_url :string(255)
#  image_url  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
      api = AmazonProductAPI.new
      api.search(isbn).each do |response|
        unless response.ebook?
          book.title = response.title
          book.author = response.authors.join(", ")
          book.publisher = response.publisher
          book.category = category_name(response)
          book.amazon_url = details_page(response.url_details_page)
          book.image_url = response.image_large.url
        else
          book.kindle_url = details_page(response.url_details_page)
        end
      end
      book.isbn = isbn
      book.save
    end
    book
  end

  private
  def self.category_name(response)
    candidate1 = response.browse_nodes[0].ancestors[0].name
    candidate2 = response.browse_nodes[0].name
    candidate3 = "なし"
    return candidate1 unless candidate1 == "ジャンル別"
    return candidate2 unless candidate2 == "ジャンル別"
    candidate3
  end

  def self.details_page(url)
    URI.decode(url)
  end
end
