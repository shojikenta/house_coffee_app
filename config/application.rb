require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HouseCoffee
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.time_zone = 'Tokyo'
    config.generators do |g|
      g.test_framework :rspec,
        controller_specs: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end
  end
end
