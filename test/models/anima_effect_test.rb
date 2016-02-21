require 'test_helper'

# Unit tests for the AnimaEffect model
class AnimaEffectTest < ActiveSupport::TestCase
  context 'an anima effect' do
    should respond_to(:character_type_id)
    should respond_to(:caste_id)
    should respond_to(:condition)
    should respond_to(:effect)
    should respond_to(:character_type)
    should respond_to(:caste)
    should respond_to(:created_at)
    should respond_to(:updated_at)
    should respond_to(:parent)

    should validate_presence_of(:condition)
    should validate_presence_of(:effect)

    should belong_to(:character_type)
    should belong_to(:caste)

    context 'with a character type' do
      setup do
        @type_effect = FactoryGirl.create(:type_anima_effect)
      end

      should 'be invalid after adding a caste' do
        @type_effect.caste = FactoryGirl.create(:caste)
        assert(!@type_effect.valid?)
      end

      should 'return character type as parent' do
        assert_equal(@type_effect.character_type, @type_effect.parent)
      end
    end

    context 'with a caste' do
      setup do
        @caste_effect = FactoryGirl.create(:caste_anima_effect)
      end

      should 'be invalid after adding a character type' do
        @caste_effect.character_type = FactoryGirl.create(:character_type)
        assert(!@caste_effect.valid?)
      end

      should 'return caste as parent' do
        assert_equal(@caste_effect.caste, @caste_effect.parent)
      end
    end
  end
end
