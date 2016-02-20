require 'test_helper'

# Unit tests for the AnimaEffect model
class AnimaEffectTest < ActiveSupport::TestCase
  should validate_presence_of(:condition)
  should validate_presence_of(:effect)

  should belong_to(:character_type)
  should belong_to(:caste)

  def setup
    @anima_effect = FactoryGirl.create(:anima_effect)
  end

  test 'should respond to fields' do
    assert_responds_to(@anima_effect, [
      :character_type_id,
      :caste_id,
      :condition,
      :effect,
      :character_type,
      :caste,
      :created_at,
      :updated_at,
      :parent
    ])
  end

  test 'should return character type as parent if caste is not defined' do
    assert_equal(@anima_effect.character_type, @anima_effect.parent)
  end

  test 'should return caste as parent if caste is defined' do
    @caste_anima_effect = FactoryGirl.create(:caste_anima_effect)
    assert_equal(@caste_anima_effect.caste, @caste_anima_effect.parent)
  end
end
