# Model for a fatsplat ie, Solar Exalt, Dragonblood, etc
class CharacterType < ActiveRecord::Base
  include Nameable

  has_many :castes, dependent: :destroy
end
