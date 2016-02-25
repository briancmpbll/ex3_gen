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
    should respond_to :remember_digest
    should respond_to :remember
    should respond_to :forget
    should respond_to :authenticated?

    should validate_presence_of :email
    should validate_presence_of :password

    should validate_uniqueness_of(:email).case_insensitive

    should validate_length_of(:email).is_at_most(50)
    should validate_length_of(:password).is_at_least(6)

    should allow_value('email@email.com').for(:email)
    should allow_value('email+email@email.com').for(:email)
    should_not allow_value('email@email,com').for(:email)
    should_not allow_value('email@email').for(:email)
    should_not allow_value('email_at_email.com').for(:email)
    should_not allow_value('not an email').for(:email)

    should 'convert email to lower case before saving' do
      email = 'EmAil@EmAiL.Com'
      new_user = FactoryGirl.build(:user, email: email)
      new_user.save
      assert_equal(new_user.email, email.downcase)
    end

    should 'not have a remember token' do
      assert_nil @user.remember_token
    end

    should 'not have a remember_digest' do
      assert_nil @user.remember_digest
    end

    should 'not be authenticated' do
      assert_not @user.authenticated?('')
    end

    context 'that is remembered' do
      setup do
        @user.remember
      end

      should 'have a remember_token' do
        assert_not_nil @user.remember_token
      end

      should 'have a remember_digest' do
        assert_not_nil @user.remember_digest
      end

      should 'be authenticated' do
        assert @user.authenticated?(@user.remember_token)
      end

      context 'and then forgotten' do
        setup do
          @user.forget
        end

        should 'not have a remember_digest' do
          assert_nil @user.remember_digest
        end
      end
    end
  end
end
