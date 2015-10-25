class Ability < ActiveRecord::Base
  has_many :caste_abilities
  has_many :castes, through: :caste_abilities

  validates :name, presence: true, uniqueness: true
end
