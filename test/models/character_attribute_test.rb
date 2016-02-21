require 'test_helper'

# Unit tests for the CharacterAttribute model
class CharacterAttributeTest < ActiveSupport::TestCase
  context 'a character attribute' do
    setup do
      @character_attribute = FactoryGirl.create(:character_attribute)
    end

    should respond_to(:name)
    should respond_to(:attribute_category_id)
    should respond_to(:attribute_category)
    should respond_to(:created_at)
    should respond_to(:updated_at)

    should belong_to(:attribute_category)

    should validate_presence_of(:attribute_category)
    should validate_presence_of(:name)

    should validate_uniqueness_of(:name)
  end
end
