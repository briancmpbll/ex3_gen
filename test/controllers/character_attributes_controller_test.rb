require 'test_helper'

# Unit tests for the character attributes controller
class CharacterAttributesControllerTest < ActionController::TestCase
  setup do
    @attribute_category = FactoryGirl.create(:attribute_category)
    @character_attribute = FactoryGirl.create(:character_attribute,
                                              attribute_category: @attribute_category)
  end

  test 'shoud not get index without category' do
    assert_raise ActionController::UrlGenerationError do
      get :index
    end
  end

  test 'should get index with category' do
    get :index, attribute_category_id: @attribute_category.id
    assert_response :success
    assert_not_nil assigns(:character_attributes)
  end

  test 'should not get new without category' do
    assert_raise ActionController::UrlGenerationError do
      get :new
    end
  end

  test 'should get new with category' do
    get :new, attribute_category_id: @attribute_category.id
    assert_response :success
  end

  test 'should not create attribute without category' do
    assert_raise ActionController::UrlGenerationError do
      post :create, character_attribute:
      FactoryGirl.attributes_for(:character_attribute, attribute_category: @attribute_category)
    end
  end

  test 'should create attribute with category' do
    assert_difference('CharacterAttribute.count') do
      post :create, character_attribute:
      FactoryGirl.attributes_for(:character_attribute, attribute_category: @attribute_category),
                    attribute_category_id: @attribute_category.id
    end

    assert_redirected_to attribute_category_path(assigns(:attribute_category))
  end

  test 'should show attribute without category' do
    get :show, id: @character_attribute
    assert_response :success
  end

  test 'should show attribute with category' do
    get :show, id: @character_attribute, attribute_category_id: @attribute_category.id
    assert_response :success
  end

  test 'should get edit without category' do
    get :edit, id: @character_attribute
    assert_response :success
  end

  test 'should get edit with category' do
    get :edit, id: @character_attribute, attribute_category_id: @attribute_category.id
    assert_response :success
  end

  test 'should update attribute without category' do
    patch :update, id: @character_attribute,
                   character_attribute: { name: @character_attribute.name }
    assert_redirected_to character_attribute_path(assigns(:character_attribute))
  end

  test 'should update attribute with category' do
    patch :update, id: @character_attribute,
                   character_attribute: { name: @character_attribute.name },
                   attribute_category_id: @attribute_category.id
    assert_redirected_to character_attribute_path(assigns(:character_attribute))
  end

  test 'should destroy attribute without category' do
    assert_difference('CharacterAttribute.count', -1) do
      delete :destroy, id: @character_attribute
    end

    assert_redirected_to attribute_category_path(@attribute_category)
  end

  test 'should destroy attribute with category' do
    assert_difference('CharacterAttribute.count', -1) do
      delete :destroy, id: @character_attribute, attribute_category_id: @attribute_category.id
    end

    assert_redirected_to attribute_category_path(@attribute_category)
  end
end
