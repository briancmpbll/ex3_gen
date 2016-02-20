require 'test_helper'

# Unit tests for the castes controller
class CastesControllerTest < ActionController::TestCase
  setup do
    @character_type = FactoryGirl.create(:character_type)
    @caste = FactoryGirl.create(:caste, character_type: @character_type)
  end

  test 'shoud not get index without parent' do
    assert_raise ActionController::UrlGenerationError do
      get :index
    end
  end

  test 'should get index with parent' do
    get :index, character_type_id: @character_type.id
    assert_response :success
    assert_not_nil assigns(:castes)
  end

  test 'should not get new without parent' do
    assert_raise ActionController::UrlGenerationError do
      get :new
    end
  end

  test 'should get new with parent' do
    get :new, character_type_id: @character_type.id
    assert_response :success
  end

  test 'should not create caste without parent' do
    assert_raise ActionController::UrlGenerationError do
      post :create, caste:
      FactoryGirl.attributes_for(:caste, character_type: @character_type)
    end
  end

  test 'should create caste with parent' do
    assert_difference('Caste.count') do
      post :create,
           caste: FactoryGirl.attributes_for(:caste, character_type: @character_type),
           character_type_id: @character_type.id
    end

    assert_redirected_to character_type_path(assigns(:character_type))
  end

  test 'should show caste' do
    get :show, id: @caste
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @caste
    assert_response :success
  end

  test 'should update caste' do
    patch :update, id: @caste, caste: { name: @caste.name }
    assert_redirected_to caste_path(assigns(:caste))
  end

  test 'should destroy caste' do
    assert_difference('Caste.count', -1) do
      delete :destroy, id: @caste
    end

    assert_redirected_to character_type_path(@character_type)
  end
end
