# == Schema Information
#
# Table name: collections
#
#  id              :integer          not null, primary key
#  organisation_id :integer          not null
#  book_id         :integer          not null
#  hondana_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_collections_on_book_id          (book_id)
#  index_collections_on_hondana_id       (hondana_id)
#  index_collections_on_organisation_id  (organisation_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (hondana_id => hondanas.id)
#  fk_rails_...  (organisation_id => organisations.id)
#

require "rails_helper"

RSpec.describe Collection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
