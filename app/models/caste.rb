class Caste < ActiveRecord::Base
  belongs_to :character_type
  has_and_belongs_to_many :abilities

  validates :name, presence: true, uniqueness: true
  validates :character_type, presence: true
end
