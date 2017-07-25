# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  name            :string(255)
#  organisation_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_organisation_id  (organisation_id)
#  index_users_on_username         (username) UNIQUE
#

class User < ApplicationRecord
  belongs_to :organisation
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  authenticates_with_sorcery!
end
