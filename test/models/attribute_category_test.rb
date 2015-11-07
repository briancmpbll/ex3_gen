require 'test_helper'

# Unit tests for the AttributeCategory model
class AttributeCategoryTest < ActiveSupport::TestCase
  should have_many(:character_attributes).dependent(:destroy)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)

  def setup
    @attribute_category = FactoryGirl.create(:attribute_category)
  end

  test 'should respond to fields' do
    assert_responds_to(@attribute_category, [
      :name,
      :character_attributes,
      :created_at,
      :updated_at
    ])
  end
end
