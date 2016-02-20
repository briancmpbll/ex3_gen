require 'test_helper'

# Unit tests for the anima effects controller
class AnimaEffectsControllerTest < ActionController::TestCase
  setup do
    @character_type = FactoryGirl.create(:character_type)
    @anima_effect = FactoryGirl.create(:anima_effect, character_type: @character_type)
    @caste = FactoryGirl.create(:caste, character_type: @character_type)
    # @caste_effect = FactoryGirl.create(:anima_effect, character_type: @character_type,
    #                                                   caste: @caste)
  end

  test 'should get character type index' do
    get :index, character_type_id: @character_type.id
    assert_response :success
    assert_not_nil assigns(:anima_effects)
  end

  test 'should get caste index' do
    get :index, character_type_id: @character_type.id, caste_id: @caste.id
    assert_response :success
    assert_not_nil assigns(:anima_effects)
  end

  test 'should get character type new' do
    get :new, character_type_id: @character_type.id
    assert_response :success
  end

  test 'should create anima effect' do
    assert_difference('AnimaEffect.count') do
      post :create,
           anima_effect: FactoryGirl.attributes_for(:anima_effect,
                                                    character_type: @character_type),
           character_type_id: @character_type.id
    end

    assert_redirected_to character_type_path(assigns(:parent))
  end

  test 'should show anima effect' do
    get :show, id: @anima_effect, character_type_id: @character_type.id
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @anima_effect, character_type_id: @character_type.id
    assert_response :success
  end

  test 'should update anima effect' do
    patch :update, id: @anima_effect, anima_effect: { effect: @anima_effect.effect },
                   character_type_id: @character_type.id
    assert_redirected_to character_type_path(assigns(:parent))
  end

  test 'should destroy anima effect' do
    assert_difference('AnimaEffect.count', -1) do
      delete :destroy, id: @anima_effect, character_type_id: @character_type.id
    end

    assert_redirected_to character_type_anima_effects_path(assigns(:parent))
  end
end
