require 'test_helper'

# Unit tests for the CharacterType model
class CharacterTypeTest < ActiveSupport::TestCase
  should have_many(:castes).dependent(:destroy)

  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)

  def setup
    @character_type = FactoryGirl.create(:character_type)
  end

  test 'should respond to fields' do
    assert_responds_to(@character_type, [
      :name,
      :castes,
      :created_at,
      :updated_at
    ])
  end
end
