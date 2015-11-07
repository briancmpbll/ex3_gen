# Model for the ability traits
class Ability < ActiveRecord::Base
  include Nameable

  has_and_belongs_to_many :castes
end
