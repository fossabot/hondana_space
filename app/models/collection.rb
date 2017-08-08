# == Schema Information
#
# Table name: collections
#
#  id         :integer          not null, primary key
#  hondana_id :integer          not null
#  book_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_collections_on_book_id     (book_id)
#  index_collections_on_hondana_id  (hondana_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (hondana_id => hondanas.id)
#

class Collection < ApplicationRecord
  belongs_to :book
  belongs_to :hondana

  attr_accessor :isbn
end
