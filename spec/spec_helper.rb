ENV['RACK_ENV'] = 'test'
require_relative '../app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rack_session_access'
require 'rack_session_access/capybara'

AppleTree.configure do |app|
  app.use RackSessionAccess::Middleware
end

Capybara.app = AppleTree

RSpec.configure do |config|

  config.formatter = 'documentation'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
