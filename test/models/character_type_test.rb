require 'test_helper'

# Unit tests for the CharacterType model
class CharacterTypeTest < ActiveSupport::TestCase
  should have_many(:castes).dependent(:destroy)

  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
end
