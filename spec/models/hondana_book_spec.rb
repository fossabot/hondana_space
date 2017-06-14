# == Schema Information
#
# Table name: hondana_books
#
#  id         :integer          not null, primary key
#  hondana_id :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_hondana_books_on_book_id     (book_id)
#  index_hondana_books_on_hondana_id  (hondana_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (hondana_id => hondanas.id)
#

require 'rails_helper'

RSpec.describe HondanaBook, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
