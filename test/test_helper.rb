ENV['RAILS_ENV'] ||= 'test'
# require File.expand_path('../../config/environment', __FILE__)
require File.expand_path(File.dirname(__FILE__) + '/../config/environment')
require 'rails/test_help'
require 'capybara/rails'
require 'shoulda'
require 'factory_girl'
FactoryGirl.find_definitions

Dir[Rails.root.join('test/modules/**.*')].each { |f| require f }
Dir[Rails.root.join('test/matchers/**.*')].each { |f| require f }

# Setup for all tests
class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end

# Setup capybara for integration tests
class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
