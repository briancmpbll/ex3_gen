# Model for attribute categories ie. Physical, Social, Mental
class AttributeCategory < ActiveRecord::Base
  has_many :character_attributes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
