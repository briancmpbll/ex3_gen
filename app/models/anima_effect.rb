# Model for a character type or caste's anima effects
class AnimaEffect < ActiveRecord::Base
  belongs_to :character_type
  belongs_to :caste

  validate :validate_parent

  validates_presence_of [:condition, :effect]

  def parent
    return caste if caste
    character_type
  end

  private

  def validate_parent
    return if caste.nil? ^ character_type.nil?
    errors.add(:base, 'Specify a character type or caste, not both')
  end
end
