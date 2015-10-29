require 'test_helper'

# Unit tests for the Ability model
class AbilityTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  should have_and_belong_to_many(:castes)
end
