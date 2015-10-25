class CreateCasteAbilities < ActiveRecord::Migration
  def change
    create_table :caste_abilities do |t|
      t.integer :caste_id
      t.integer :ability_id
    end
    add_index :caste_abilities, :caste_id
    add_index :caste_abilities, :ability_id
    add_foreign_key :caste_abilities, :castes
    add_foreign_key :caste_abilities, :abilities
  end
end
