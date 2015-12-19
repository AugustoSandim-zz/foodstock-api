require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module FoodstockApi
  class Application < Rails::Application
    config.generators do |g|
        g.assets false
        g.helpers false
        g.test_framework :rspec, controller_specs: false, view_specs: false, routing_specs: false
        g.fixture_replacement :factory_girl, dir: "spec/factories"
    end    

    config.active_record.raise_in_transactional_callbacks = true
  end
end
