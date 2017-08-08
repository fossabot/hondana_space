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

class Organisation < ApplicationRecord
  has_many :hondanas
  has_many :users

  validates :subdomain,
              presence: true,
              uniqueness: true,
              exclusion: { in: %w(
                about
                abuse
                ad
                admin
                ads
                adword
                affiliate
                alpha
                api
                app
                auth
                authenticate
                beta
                billing
                biz
                blog
                contact
                dashboard
                demo
                dev
                doc
                docs
                document
                feed
                help
                invoice
                job
                join
                legal
                login
                logout
                register
                release
                search
                signin
                signup
                sitemap
                staging
                support
                survey
                test
                www
              ) }
end
