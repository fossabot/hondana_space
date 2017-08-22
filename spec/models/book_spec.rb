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

require "rails_helper"

RSpec.describe Book, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
