class AnimaEffect < ActiveRecord::Base
  belongs_to :character_type
  belongs_to :caste

  validates :character_type, presence: true
  validates :condition, presence: true
  validates :effect, presence: true
end
