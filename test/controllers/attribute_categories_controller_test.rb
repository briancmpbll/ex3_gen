require 'test_helper'

# Unit tests for the attribute categories controller
class AttributeCategoriesControllerTest < ActionController::TestCase
  setup do
    @attribute_category = FactoryGirl.create(:attribute_category)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:attribute_categories)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create attribute_category' do
    assert_difference('AttributeCategory.count') do
      post :create, attribute_category: FactoryGirl.attributes_for(:attribute_category)
    end

    assert_redirected_to attribute_category_path(assigns(:attribute_category))
  end

  test 'should show attribute_category' do
    get :show, id: @attribute_category
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @attribute_category
    assert_response :success
  end

  test 'should update attribute_category' do
    patch :update, id: @attribute_category, attribute_category: { name: @attribute_category.name }
    assert_redirected_to attribute_category_path(assigns(:attribute_category))
  end

  test 'should destroy attribute_category' do
    assert_difference('AttributeCategory.count', -1) do
      delete :destroy, id: @attribute_category
    end

    assert_redirected_to attribute_categories_path
  end
end
