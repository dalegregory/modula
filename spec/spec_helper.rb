require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

require 'rails/application'
require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.filter_run focus: true
  config.mock_with  :rspec

  config.run_all_when_everything_filtered                = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.use_transactional_fixtures                      = true

  config.include Devise::TestHelpers, :type => :controller
  config.include PermissionsMatcher,  :type => :request

  config.before :each do
    SimpleCov.command_name "RSpec:#{ Process.pid.to_s }#{ ENV['TEST_ENV_NUMBER'] }"
  end
end
