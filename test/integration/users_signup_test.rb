require 'test_helper'

# Integration test for signing up a new user.
class UsersSignupTest < ActionDispatch::IntegrationTest
  context 'submitting the signup form' do
    setup do
      get signup_path
      @user_count = User.count
    end

    context 'with a blank user' do
      setup do
        post users_path, user: FactoryGirl.attributes_for(:blank_user)
      end

      should 'not create a user' do
        assert_equal(@user_count, User.count)
      end

      should 'render the new user template' do
        assert_template 'users/new'
      end
    end

    context 'with a valid user' do
      setup do
        post_via_redirect users_path, user: FactoryGirl.attributes_for(:user)
      end

      should 'create a user' do
        assert_equal(User.count - @user_count, 1)
      end

      should 'render the show template' do
        assert_template 'users/show'
      end

      should 'set the flash' do
        assert_equal 'User was successfully created.', flash[:notice]
      end
    end
  end
end
