require 'test_helper'

# Unit tests for the User model
class UserTest < ActiveSupport::TestCase
  context 'a user' do
    setup do
      @user = FactoryGirl.create(:user)
    end

    should have_secure_password

    should respond_to :email
    should respond_to :password
    should respond_to :password_confirmation
    should respond_to :password_digest

    should validate_presence_of :email

    should validate_uniqueness_of(:email).case_insensitive

    should allow_value('email@email.com').for(:email)
    should allow_value('email+email@email.com').for(:email)
    should_not allow_value('email@email').for(:email)
    should_not allow_value('not an email').for(:email)
  end
end
