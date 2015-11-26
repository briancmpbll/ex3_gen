require 'test_helper'

# Unit tests for the castes controller
class CastesControllerTest < ActionController::TestCase
  setup do
    @character_type = FactoryGirl.create(:character_type)
    @caste = FactoryGirl.create(:caste, character_type: @character_type)
  end

  test 'should get index' do
    get :index, character_type_id: @character_type.id
    assert_response :success
    assert_not_nil assigns(:castes)
  end

  test 'should get new' do
    get :new, character_type_id: @character_type.id
    assert_response :success
  end

  test 'should create caste' do
    assert_difference('Caste.count') do
      post :create,
           caste: FactoryGirl.attributes_for(:caste, character_type: @character_type),
           character_type_id: @character_type.id
    end

    assert_redirected_to character_type_path(assigns(:character_type))
  end

  test 'should show caste' do
    get :show, id: @caste, character_type_id: @character_type.id
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @caste, character_type_id: @character_type.id
    assert_response :success
  end

  test 'should update caste' do
    patch :update, id: @caste, caste: { name: @caste.name }, character_type_id: @character_type.id
    assert_redirected_to character_type_path(assigns(:character_type))
  end

  test 'should destroy caste' do
    assert_difference('Caste.count', -1) do
      delete :destroy, id: @caste, character_type_id: @character_type.id
    end

    assert_redirected_to character_type_castes_path(assigns(:character_type))
  end
end
