class CasteAbility < ActiveRecord::Base
  belongs_to :ability
  belongs_to :caste

  validates :ability_id, uniqueness: {scope: :caste_id}
end
