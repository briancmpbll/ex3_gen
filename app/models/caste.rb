# Model for castes, aspects, or other mini splat
class Caste < ActiveRecord::Base
  include Nameable
  include AnimaEffectOwner

  belongs_to :character_type
  has_and_belongs_to_many :abilities

  validates :character_type, presence: true
end
