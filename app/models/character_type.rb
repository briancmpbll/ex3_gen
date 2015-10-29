# Model for a fatsplat ie, Solar Exalt, Dragonblood, etc
class CharacterType < ActiveRecord::Base
  has_many :castes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
