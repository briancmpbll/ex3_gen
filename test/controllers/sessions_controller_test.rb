require 'test_helper'

# Unit tests for the sessions controller
class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
  end

  context 'getting new session' do
    setup do
      get :new
    end

    should respond_with :success
    should render_template :new
    should_not set_flash
  end

  context 'creating session with invalid information' do
    setup do
      post :create, session: { email: '', password: '' }
    end

    should respond_with :success
    should render_template :new
    should set_flash.now[:danger]

    should 'not log in a user' do
      assert_not logged_in?
    end
  end

  context 'creating session with valid information' do
    setup do
      post :create, session: { email: @user.email, password: @user.password }
    end

    should respond_with :redirect
    should redirect_to('the URL for the logged in profile') { user_path(@user) }
    should set_flash[:notice]

    should 'log in a user' do
      assert logged_in?
    end

    should 'log in the correct user' do
      assert_equal @user, current_user
    end

    context 'and then deleting it' do
      setup do
        delete :destroy
      end

      should respond_with :redirect
      should redirect_to('the root path') { '/' }
      should_not set_flash

      should 'log out the user' do
        assert_not logged_in?
      end
    end
  end

  context 'deleting session without logged in user' do
    setup do
      delete :destroy
    end

    should respond_with :redirect
    should redirect_to('the root path') { '/' }
    should_not set_flash

    should 'not log in a user' do
      assert_not logged_in?
    end
  end
end
