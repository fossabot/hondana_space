# == Schema Information
#
# Table name: hondanas
#
#  id              :integer          not null, primary key
#  organisation_id :integer
#  name            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_hondanas_on_organisation_id  (organisation_id)
#
# Foreign Keys
#
#  fk_rails_...  (organisation_id => organisations.id)
#

require "rails_helper"

RSpec.describe Hondana, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
