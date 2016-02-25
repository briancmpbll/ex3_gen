require 'test_helper'

# Unit tests for the abilities controller
class AbilitiesControllerTest < ActionController::TestCase
  setup do
    @ability = FactoryGirl.create(:ability)
  end

  context 'getting ability index' do
    setup do
      get :index
    end

    should respond_with :success
    should render_template :index
    should render_template partial: '_list'
    should_not set_flash
  end

  context 'getting new ability' do
    setup do
      get :new
    end

    should respond_with :success
    should render_template :new
    should render_template partial: '_form'
    should_not set_flash
  end

  context 'showing ability' do
    setup do
      get :show, id: @ability
    end

    should respond_with :success
    should render_template :show
    should_not set_flash
  end

  context 'creating ability' do
    setup do
      @pre_count = Ability.count
      @attr = FactoryGirl.attributes_for(:ability)
      post :create, ability: @attr
    end

    should respond_with :redirect
    should redirect_to('the URL for the new ability') { ability_path(assigns :ability) }
    should set_flash[:notice]

    should 'create one ability' do
      assert_equal(Ability.count - @pre_count, 1)
    end
  end

  context 'getting edit ability' do
    setup do
      get :edit, id: @ability
    end

    should respond_with :success
    should render_template :edit
    should render_template partial: '_form'
    should_not set_flash
  end

  context 'updating ability' do
    setup do
      @pre_count = Ability.count
      patch :update, id: @ability, ability: { name: @ability.name }
    end

    should respond_with :redirect
    should redirect_to('the URL for the edited ability') { ability_path(assigns :ability) }
    should set_flash[:notice]

    should 'not change the ability count' do
      assert_equal(Ability.count, @pre_count)
    end
  end

  context 'deleting ability' do
    setup do
      @pre_count = Ability.count
      delete :destroy, id: @ability
    end

    should respond_with :redirect
    should redirect_to('the URL for abilities index') { abilities_path }
    should set_flash[:notice]

    should 'delete one ability' do
      assert_equal(Ability.count - @pre_count, -1)
    end
  end
end
