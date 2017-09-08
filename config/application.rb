require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)
module HondanaSpace
  class Application < Rails::Application
    config.load_defaults 5.1
    config.generators do |generate|
      generate.helper false
      generate.javascripts false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local
  end
end
