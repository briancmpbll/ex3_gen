require 'test_helper'

# Unit tests for the AttributeCategory model
class AttributeCategoryTest < ActiveSupport::TestCase
  context 'an attribute category' do
    should respond_to(:name)
    should respond_to(:character_attributes)
    should respond_to(:created_at)
    should respond_to(:updated_at)

    should have_many(:character_attributes).dependent(:destroy)
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
  end
end
