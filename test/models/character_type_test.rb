require 'test_helper'

# Unit tests for the CharacterType model
class CharacterTypeTest < ActiveSupport::TestCase
  context 'a character type' do
    setup do
      @character_type = FactoryGirl.create(:character_type)
    end

    should respond_to(:name)
    should respond_to(:castes)
    should respond_to(:created_at)
    should respond_to(:updated_at)

    should have_many(:castes).dependent(:destroy)
    should have_many(:anima_effects).dependent(:destroy)

    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
  end
end
