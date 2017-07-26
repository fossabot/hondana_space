# == Schema Information
#
# Table name: organisations
#
#  id         :integer          not null, primary key
#  subdomain  :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_organisations_on_subdomain  (subdomain) UNIQUE
#

require "rails_helper"

RSpec.describe Organisation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
