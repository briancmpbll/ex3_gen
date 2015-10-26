class UniquenessOfCasteAbility < ActiveRecord::Migration
  def change
    add_index :caste_abilities, [:caste_id, :ability_id], unique: true
  end
end
