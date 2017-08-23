# == Schema Information
#
# Table name: collections
#
#  id              :integer          not null, primary key
#  organisation_id :integer          not null
#  book_id         :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_collections_on_book_id          (book_id)
#  index_collections_on_organisation_id  (organisation_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (organisation_id => organisations.id)
#

class Collection < ApplicationRecord
  belongs_to :organisation
  belongs_to :book

  attr_accessor :isbn
end
