class FixNullColumns < ActiveRecord::Migration
  def change
    change_column :castes, :character_type_id, :integer, null: false
    change_column :character_attributes, :attribute_category_id, :integer, null: false
    change_column :caste_abilities, :caste_id, :integer, null: false
    change_column :caste_abilities, :ability_id, :integer, null: false
  end
end
