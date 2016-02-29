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
  include Rails.application.routes.url_helpers

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

  private

  # Returns true inside an integration test.
  def integration_test?
    defined?(post_via_redirect)
  end
end

# Setup for controller tests
class ActionController::TestCase
  def current_user_test
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in_test?
    !current_user_test.nil?
  end
end

# Setup capybara for integration tests
class ActionDispatch::IntegrationTest
  include Capybara::DSL
  self.use_transactional_fixtures = false

  def logged_in_menu?(user)
    (has_no_link? 'Log in') &&
      (has_link? 'Log out') &&
      (has_link? 'Profile') &&
      (has_link? user.name)
  end
end
