require 'test_helper'

# Unit tests for the Caste model
class CasteTest < ActiveSupport::TestCase
  context 'a caste' do
    setup do
      @caste = FactoryGirl.create(:caste)
    end

    should respond_to(:name)
    should respond_to(:character_type_id)
    should respond_to(:character_type)
    should respond_to(:abilities)
    should respond_to(:created_at)
    should respond_to(:updated_at)

    should belong_to(:character_type)
    should have_many(:anima_effects).dependent(:destroy)
    should have_and_belong_to_many(:abilities)

    should validate_presence_of(:character_type)
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
  end
end
