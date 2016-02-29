require 'test_helper'

# Unit test for the Users controller
class UsersControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:user)
    @admin_user = FactoryGirl.create(:admin_user)
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
    context 'getting user index' do
      setup do
        get :index
      end

      should redirect_to_login
      should set_flash[:danger]
    end

    context 'getting edit user' do
      setup do
        get :edit, id: @user
      end

      should redirect_to_login
      should set_flash[:danger]
    end

    context 'update user' do
      setup do
        @pre_count = User.count
        patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
      end

      should redirect_to_login
      should set_flash[:danger]

      should 'not change the user count' do
        assert_equal(@pre_count, User.count)
      end

      should 'not change the user' do
        assert_equal(@user, User.find(@user.id))
      end
    end

    context 'deleting a user' do
      setup do
        @pre_count = User.count
        delete :destroy, id: @user
      end

      should redirect_to_login
      should set_flash[:danger]

      should 'not delete a user' do
        assert_equal(User.count, @pre_count)
      end
    end
  end

  context 'when logged in as a normal user' do
    setup do
      log_in_as @user
    end

    context 'getting user index' do
      setup do
        get :index
      end

      should respond_with :success
      should render_template :index
      should_not set_flash
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
                                          email: @new_user.email,
                                          admin: true }
      end

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

      should 'not change the admin flag' do
        assert_not User.find(@user.id).admin?
      end
    end

    context 'editing another user' do
      setup do
        get :edit, id: @other_user
      end

      should redirect_to_root
      should_not set_flash
    end

    context 'updating another user' do
      setup do
        get :edit, id: @other_user
      end

      should redirect_to_root
      should_not set_flash
    end

    context 'deleting a user' do
      setup do
        @pre_count = User.count
        delete :destroy, id: @other_user
      end

      should redirect_to_root
      should_not set_flash

      should 'not delete a user' do
        assert_equal(User.count, @pre_count)
      end
    end
  end

  context 'when logged in as an admin' do
    setup do
      log_in_as @admin_user
    end

    context 'deleting a user' do
      setup do
        @pre_count = User.count
        delete :destroy, id: @other_user
      end

      should redirect_to_user_index
      should set_flash[:success]

      should 'delete a user' do
        assert_equal(-1, User.count - @pre_count)
      end

      should 'delete the right user' do
        assert_raises(ActiveRecord::RecordNotFound) { User.find(@other_user.id) }
      end
    end

    context 'deleting self' do
      setup do
        @pre_count = User.count
        delete :destroy, id: @admin_user
      end

      should redirect_to_user_index
      should set_flash[:danger]

      should 'not delete the user' do
        assert_equal(@pre_count, User.count)
      end
    end
  end
end
