# Model for attribute traits
class CharacterAttribute < ActiveRecord::Base
  include Nameable

  belongs_to :attribute_category

  validates_presence_of :attribute_category
end
