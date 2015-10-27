class AttributeCategory < ActiveRecord::Base
  has_many :character_attributes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
