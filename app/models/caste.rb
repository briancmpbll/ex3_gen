class Caste < ActiveRecord::Base
  belongs_to :character_type
  has_many :caste_abilities
  has_many :abilities, through: :caste_abilities

  validates :name, presence: true, uniqueness: true
  validates :character_type_id, presence: true
end
