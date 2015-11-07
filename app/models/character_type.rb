# Model for a fatsplat ie, Solar Exalt, Dragonblood, etc
class CharacterType < ActiveRecord::Base
  include Nameable
  include AnimaEffectOwner

  has_many :castes, dependent: :destroy
end
