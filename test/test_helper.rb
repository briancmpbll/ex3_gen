ENV['RAILS_ENV'] ||= 'test'
# require File.expand_path('../../config/environment', __FILE__)
require File.expand_path(File.dirname(__FILE__) + '/../config/environment')
require 'rails/test_help'
require 'capybara/rails'
require 'shoulda'
require 'factory_girl'
require 'database_cleaner'
FactoryGirl.find_definitions
DatabaseCleaner.strategy = :truncation

Dir[Rails.root.join('test/modules/**.*')].each { |f| require f }
Dir[Rails.root.join('test/matchers/**.*')].each { |f| require f }

# Setup for all tests
class ActiveSupport::TestCase
  self.use_transactional_fixtures = false
  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end

  def current_user_test
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in_test?
    if integration_test?
      (has_no_link? 'Log in') &&
        (has_link? 'Log out') &&
        (has_link? 'Profile')
    else
      !current_user_test.nil?
    end
  end

  # Log in as a test user
  def log_in_as(user)
    if integration_test?
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    else
      session[:user_id] = user.id
    end
  end

  # Log out from the current user
  def log_out
    if integration_test?
      return unless logged_in_test?
      click_link 'user_dropdown'
      click_link 'Log out'
    else
      session.delete(:user_id)
    end
  end

  private

  # Returns true inside an integration test.
  def integration_test?
    defined?(post_via_redirect)
  end
end

# Setup capybara for integration tests
class ActionDispatch::IntegrationTest
  include Capybara::DSL

  teardown do
    log_out
  end
end
