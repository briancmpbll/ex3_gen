require 'test_helper'

# Unit tests for the AnimaEffect model
class AnimaEffectTest < ActiveSupport::TestCase
  should validate_presence_of(:character_type)
  should validate_presence_of(:condition)
  should validate_presence_of(:effect)

  should belong_to(:character_type)
  should belong_to(:caste)

  def setup
    @anima_effect = FactoryGirl.create(:anima_effect)
  end

  test 'should respond to fields' do
    assert_responds_to(@anima_effect, [:character_type_id,
                                       :caste_id,
                                       :condition,
                                       :effect,
                                       :character_type,
                                       :caste,
                                       :created_at,
                                       :updated_at])
  end
end
