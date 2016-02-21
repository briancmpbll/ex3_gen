# Model for castes, aspects, or other mini splat
class Caste < ActiveRecord::Base
  include Nameable
  include AnimaEffectOwner

  belongs_to :character_type
  has_and_belongs_to_many :abilities

  validates_presence_of :character_type
end
