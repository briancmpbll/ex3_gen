require 'test_helper'

# Unit tests for the AnimaEffect model
class AnimaEffectTest < ActiveSupport::TestCase
  should validate_presence_of(:character_type)
  should validate_presence_of(:condition)
  should validate_presence_of(:effect)

  should belong_to(:character_type)
  should belong_to(:caste)
end
