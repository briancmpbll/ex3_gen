require 'test_helper'

# Unit tests for the Caste model
class CasteTest < ActiveSupport::TestCase
  should belong_to(:character_type)
  should have_many(:anima_effects).dependent(:destroy)
  should have_and_belong_to_many(:abilities)

  should validate_presence_of(:character_type)
  should validate_presence_of(:name)

  test 'validates uniqueness of name' do
    FactoryGirl.create(:caste)
    validate_uniqueness_of(:name)
  end

  def setup
    @caste = FactoryGirl.create(:caste)
  end

  test 'should respond to fields' do
    assert_responds_to(@caste, [
      :name,
      :character_type_id,
      :character_type,
      :abilities,
      :created_at,
      :updated_at
    ])
  end
end
