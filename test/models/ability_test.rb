require 'test_helper'

# Unit tests for the Ability model
class AbilityTest < ActiveSupport::TestCase
  context 'an ability' do
    setup do
      @ability = FactoryGirl.create(:ability)
    end

    should respond_to(:name)
    should respond_to(:castes)
    should respond_to(:created_at)
    should respond_to(:updated_at)

    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
    should have_and_belong_to_many(:castes)
  end
end
