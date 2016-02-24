require 'test_helper'

# Integration test for signing in a user.
class UsersLoginTest < ActionDispatch::IntegrationTest
  context 'the login page' do
    setup do
      get login_path
    end

    should 'render the new template' do
      assert_template 'sessions/new'
    end

    context 'submitted with an invalid user' do
      setup do
        post login_path, session: { email: '', password: '' }
      end

      should 'render the new template' do
        assert_template 'sessions/new'
      end

      should 'set the flash' do
        assert_equal 'Invalid email/password combination', flash[:danger]
      end

      should 'not have the flash set after navigating away' do
        get root_path
        assert flash.empty?
      end
    end

    context 'submitted with a valid user' do
      setup do
        @user = FactoryGirl.create(:user)
        post_via_redirect login_path, session: { email: @user.email,
                                                 password: @user.password }
      end

      should 'render the users/show template' do
        assert_template 'users/show'
      end

      should 'set the flash' do
        assert_equal 'Welcome back!', flash[:notice]
      end

      should 'not have the flash set after navigating away' do
        get root_path
        assert flash.empty?
      end
    end
  end
end
