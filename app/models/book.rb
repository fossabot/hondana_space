# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  isbn         :string(255)
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
  has_many :hondana_books
  has_many :hondanas, through: :hondana_books
end
