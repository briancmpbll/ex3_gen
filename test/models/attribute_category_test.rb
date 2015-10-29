require 'test_helper'

# Unit tests for the AttributeCategory model
class AttributeCategoryTest < ActiveSupport::TestCase
  should have_many(:character_attributes).dependent(:destroy)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
end
