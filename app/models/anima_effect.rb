# Model for a character type or caste's anima effects
class AnimaEffect < ActiveRecord::Base
  belongs_to :character_type, dependent: :destroy
  belongs_to :caste, dependent: :destroy

  validates :character_type, presence: true
  validates :condition, presence: true
  validates :effect, presence: true
end
