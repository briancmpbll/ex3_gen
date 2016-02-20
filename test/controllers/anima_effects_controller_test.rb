require 'test_helper'

# Unit tests for the anima effects controller
class AnimaEffectsControllerTest < ActionController::TestCase
  setup do
    @character_type = FactoryGirl.create(:character_type)
    @type_effect = FactoryGirl.create(:type_anima_effect, character_type: @character_type)
    @caste = FactoryGirl.create(:caste, character_type: @character_type)
    @caste_effect = FactoryGirl.create(:caste_anima_effect, caste: @caste)
  end

  test 'shoud not get index without parent' do
    assert_raise ActionController::UrlGenerationError do
      get :index
    end
  end

  test 'should get character type index' do
    get :index, character_type_id: @character_type.id
    assert_response :success
    assert_not_nil assigns(:anima_effects)
  end

  test 'should get caste index' do
    get :index, caste_id: @caste.id
    assert_response :success
    assert_not_nil assigns(:anima_effects)
  end

  test 'should not get new without parent' do
    assert_raise ActionController::UrlGenerationError do
      get :new
    end
  end

  test 'should get character type new' do
    get :new, character_type_id: @character_type.id
    assert_response :success
  end

  test 'should get caste new' do
    get :new, caste_id: @caste.id
    assert_response :success
  end

  test 'should not create attribute without parent' do
    assert_raise ActionController::UrlGenerationError do
      post :create, anima_effect:
      FactoryGirl.attributes_for(:anima_effect, attribute_category: @attribute_category)
    end
  end

  test 'should create character type anima effect' do
    assert_difference('AnimaEffect.count') do
      post :create,
           anima_effect: FactoryGirl.attributes_for(:anima_effect,
                                                    character_type: @character_type),
           character_type_id: @character_type.id
    end

    assert_redirected_to character_type_path(assigns(:parent))
  end

  test 'should create caste anima effect' do
    assert_difference('AnimaEffect.count') do
      post :create,
           anima_effect: FactoryGirl.attributes_for(:caste_anima_effect,
                                                    character_type: @character_type,
                                                    caste: @caste),
           caste_id: @caste.id
    end

    assert_redirected_to caste_path(assigns(:parent))
  end

  test 'should show anima effect' do
    get :show, id: @type_effect
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @type_effect
    assert_response :success
  end

  test 'should update character type anima effect' do
    patch :update, id: @type_effect, anima_effect: { effect: @type_effect.effect }
    assert_redirected_to anima_effect_path(assigns(:anima_effect))
  end

  test 'should update caste anima effect' do
    patch :update, id: @caste_effect, anima_effect: { effect: @caste_effect.effect }
    assert_redirected_to anima_effect_path(assigns(:anima_effect))
  end

  test 'should destroy character type anima effect' do
    assert_difference('AnimaEffect.count', -1) do
      delete :destroy, id: @type_effect
    end

    assert_redirected_to character_type_path(@character_type, assigns(:parent))
  end

  test 'should destroy caste anima effect' do
    assert_difference('AnimaEffect.count', -1) do
      delete :destroy, id: @caste_effect
    end

    assert_redirected_to caste_path(@caste, assigns(:parent))
  end
end
