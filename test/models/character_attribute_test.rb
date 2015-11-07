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

  def setup
    @character_attribute = FactoryGirl.create(:character_attribute)
  end

  test 'should respond to fields' do
    assert_responds_to(@character_attribute, [
      :name,
      :attribute_category_id,
      :attribute_category,
      :created_at,
      :updated_at
    ])
  end
end
