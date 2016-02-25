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
end

# Setup for controller tests
class ActionController::TestCase
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end

# Setup capybara for integration tests
class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def logged_in_menu?
    (has_no_link? 'Log in') &&
      (has_link? 'Log out') &&
      (has_link? 'Profile')
  end
end
