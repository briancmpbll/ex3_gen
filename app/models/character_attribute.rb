class CharacterAttribute < ActiveRecord::Base
  belongs_to :attribute_category

  validates :name, presence: true, uniqueness: true
  validates :attribute_category, presence: true
end
