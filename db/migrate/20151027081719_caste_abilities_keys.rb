class CasteAbilitiesKeys < ActiveRecord::Migration
  def change
    add_index :castes_abilities, [:caste_id, :ability_id], unique: true
    add_foreign_key :castes_abilities, :castes
    add_foreign_key :castes_abilities, :abilities
  end
end
