require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dawnrebirth
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Europe/Berlin'
		config.active_record.default_timezone = :utc # Or :local
		#config.i18n.default_locale = :de
		config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
