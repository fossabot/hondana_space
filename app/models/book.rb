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
  def self.find_or_create_by_isbn(isbn)
    book = self.find_or_initialize_by(isbn: ISBN.thirteen(isbn))
    if book.new_record?
      book.retrieve_from_amazon!
    end
    book
  end

  def self.update_by_isbn(isbn)
    book = self.find_by(isbn: ISBN.thirteen(isbn))
    book.retrieve_from_amazon!
  end

  def retrieve_from_amazon!
    api = AmazonProductAPI.new
    responses = api.search(self.isbn)
    if responses.has_error?
      raise responses.error.message
    end
    responses.each do |response|
      unless response.ebook?
        self.isbn = ISBN.thirteen(response.isbn)
        self.title = response.title
        self.author = response.authors.join(", ")
        self.publisher = response.publisher
        self.category = category_name(response)
        self.amazon_url = details_page(response.url_details_page)
        self.image_url = response.image_large.url
      else
        self.kindle_url = details_page(response.url_details_page)
      end
    end
    self
  end

  private
  def category_name(response)
    candidate1 = response.browse_nodes[0].ancestors[0].name
    candidate2 = response.browse_nodes[0].name
    candidate3 = "なし"
    return candidate1 unless candidate1 == "ジャンル別"
    return candidate2 unless candidate2 == "ジャンル別"
    candidate3
  end

  def details_page(url)
    URI.decode(url)
  end
end
