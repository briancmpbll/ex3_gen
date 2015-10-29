# Model for attribute traits
class CharacterAttribute < ActiveRecord::Base
  belongs_to :attribute_category, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :attribute_category, presence: true
end
