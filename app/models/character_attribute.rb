# Model for attribute traits
class CharacterAttribute < ActiveRecord::Base
  include Nameable

  belongs_to :attribute_category

  validates :attribute_category, presence: true
end
