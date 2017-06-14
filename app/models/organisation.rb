# == Schema Information
#
# Table name: organisations
#
#  id         :integer          not null, primary key
#  subdomain  :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_organisations_on_subdomain  (subdomain) UNIQUE
#

class Organisation < ApplicationRecord
  has_many :hondanas
  has_one :user
end
