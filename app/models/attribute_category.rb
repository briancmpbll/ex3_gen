# Model for attribute categories ie. Physical, Social, Mental
class AttributeCategory < ActiveRecord::Base
  include Nameable

  has_many :character_attributes, dependent: :destroy
end
