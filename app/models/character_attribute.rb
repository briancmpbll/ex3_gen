class CharacterAttribute < ActiveRecord::Base
  belongs_to :attribute_category

  validates :name, presence: true, uniqueness: true
  validates :attribute_category_id, presence: true
end
