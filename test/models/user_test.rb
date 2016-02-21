require 'test_helper'

# Unit tests for the User model
class UserTest < ActiveSupport::TestCase
  context 'a user' do
    should respond_to :email
    should respond_to :encrypted_password
    should respond_to :salt
  end
end
