require 'test_helper'

# Unit tests for the CharacterAttribute model
class CharacterAttributeTest < ActiveSupport::TestCase
  should belong_to(:attribute_category).dependent(:destroy)

  should validate_presence_of(:attribute_category)
  should validate_presence_of(:name)

  test 'validates uniqueness of name' do
    FactoryGirl.create(:attribute_category)
    validate_uniqueness_of(:name)
  end
end
