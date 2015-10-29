# Model for the ability traits
class Ability < ActiveRecord::Base
  has_and_belongs_to_many :castes

  validates :name, presence: true, uniqueness: true
end
