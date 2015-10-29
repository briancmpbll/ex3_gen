require 'test_helper'

# Unit tests for the character attributes controller
class CharacterAttributesControllerTest < ActionController::TestCase
  setup do
    @attribute_category = FactoryGirl.create(:attribute_category)
    @character_attribute = FactoryGirl.create(:character_attribute,
                                              attribute_category: @attribute_category)
  end

  test 'should get index' do
    get :index, attribute_category_id: @attribute_category.id
    assert_response :success
    assert_not_nil assigns(:character_attributes)
  end

  test 'should get new' do
    get :new, attribute_category_id: @attribute_category.id
    assert_response :success
  end

  test 'should create attribute' do
    assert_difference('CharacterAttribute.count') do
      post :create, character_attribute:
      FactoryGirl.attributes_for(:character_attribute, attribute_category: @attribute_category),
                    attribute_category_id: @attribute_category.id
    end

    assert_redirected_to attribute_category_path(assigns(:attribute_category))
  end

  test 'should show attribute' do
    get :show, id: @character_attribute, attribute_category_id: @attribute_category.id
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @character_attribute, attribute_category_id: @attribute_category.id
    assert_response :success
  end

  test 'should update attribute' do
    patch :update, id: @character_attribute,
                   character_attribute: { name: @character_attribute.name },
                   attribute_category_id: @attribute_category.id
    assert_redirected_to attribute_category_path(assigns(:attribute_category))
  end

  test 'should destroy attribute' do
    assert_difference('CharacterAttribute.count', -1) do
      delete :destroy, id: @character_attribute, attribute_category_id: @attribute_category.id
    end

    assert_redirected_to attribute_category_character_attributes_path(@attribute_category)
  end
end
