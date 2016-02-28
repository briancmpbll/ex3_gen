require 'test_helper'

# Unit test for the Users controller
class UsersControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
  end

  context 'getting user index' do
    setup do
      get :index
    end

    should respond_with :success
    should render_template :index
    should_not set_flash
  end

  context 'getting new user' do
    setup do
      get :new
    end

    should respond_with :success
    should render_template :new
    should render_template partial: '_form'
    should_not set_flash
  end

  context 'showing user' do
    setup do
      get :show, id: @user
    end

    should respond_with :success
    should render_template :show
    should_not set_flash
  end

  context 'creating user with invalid information' do
    setup do
      @pre_count = User.count
      post :create, user: { name: '', email: '', password: '', password_confirmation: '' }
    end

    should respond_with :success
    should render_template :new
    should_not set_flash

    should 'not create a user' do
      assert_equal(@pre_count, User.count)
    end
  end

  context 'creating user with valid information' do
    setup do
      @pre_count = User.count
      post :create, user: FactoryGirl.attributes_for(:user)
    end

    should respond_with :redirect
    should redirect_to('the URL for the new user') { user_path(assigns :user) }
    should set_flash[:success]

    should 'create a user' do
      assert_equal(1, User.count - @pre_count)
    end

    should 'login a user' do
      assert logged_in_test?
    end
  end

  context 'when not logged in' do
    context 'getting edit user' do
      setup do
        get :edit, id: @user
      end

      should respond_with :redirect
      should redirect_to('the login path') { login_path }
      should set_flash[:danger]
    end

    context 'update user' do
      setup do
        @pre_count = User.count
        @old_user = @user
        patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
      end

      should respond_with :redirect
      should redirect_to('the login path') { login_path }
      should set_flash[:danger]

      should 'not change the user count' do
        assert_equal(@pre_count, User.count)
      end

      should 'not change the user' do
        assert_equal(@old_user, @user)
      end
    end
  end

  context 'when logged in' do
    setup do
      log_in_as @user
    end

    context 'getting edit user' do
      setup do
        get :edit, id: @user
      end

      should respond_with :success
      should render_template :edit
      should render_template partial: '_form'
      should_not set_flash
    end

    context 'update user' do
      setup do
        @pre_count = User.count
        @new_user = FactoryGirl.build(:user)
        patch :update, id: @user, user: { name: @new_user.name,
                                          email: @new_user.email }
      end

      should respond_with :redirect
      should redirect_to('the URL for the edited user') { user_path(assigns :user) }
      should set_flash[:success]

      should 'not change the user count' do
        assert_equal(@pre_count, User.count)
      end

      should 'change the user name' do
        assert_equal(User.find(@user.id).name, @new_user.name)
      end

      should 'change the user email' do
        assert_equal(User.find(@user.id).email, @new_user.email)
      end
    end

    context 'trying to edit another user' do
      setup do
        @new_user = FactoryGirl.create(:user)
        get :edit, id: @new_user
      end

      should respond_with :redirect
      should redirect_to '/'
      should_not set_flash
    end

    context 'trying to update anotether user' do
      setup do
        @new_user = FactoryGirl.create(:user)
        get :edit, id: @new_user
      end

      should respond_with :redirect
      should redirect_to '/'
      should_not set_flash
    end
  end

  context 'deleting a user' do
    setup do
      @pre_count = User.count
      delete :destroy, id: @user
    end

    should respond_with :redirect
    should redirect_to('the URL for user index') { users_path }
    should set_flash[:notice]

    should 'delete one ability' do
      assert_equal(-1, User.count - @pre_count)
    end
  end
end
