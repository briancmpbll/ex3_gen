class CasteAbility < ActiveRecord::Base
  belongs_to :ability
  belongs_to :caste
end
