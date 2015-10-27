class DropCasteAbilities < ActiveRecord::Migration
  def change
    drop_table :caste_abilities

    create_table :castes_abilities, id: false do |t|
      t.belongs_to :caste, index: true
      t.belongs_to :ability, index: true
    end
  end
end
