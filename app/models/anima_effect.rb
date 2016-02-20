# Model for a character type or caste's anima effects
class AnimaEffect < ActiveRecord::Base
  belongs_to :character_type
  belongs_to :caste

  validates :character_type, presence: !:caste.present?
  validates :caste, presence: !:character_type.present?
  validates :condition, presence: true
  validates :effect, presence: true

  def parent
    return caste if caste
    character_type
  end
end
