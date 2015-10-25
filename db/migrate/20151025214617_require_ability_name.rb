class RequireAbilityName < ActiveRecord::Migration
  def change
    change_column_null :abilities, :name, false
    add_index :abilities, :name, :unique => true
    add_index :castes, :name, :unique => true
    add_index :character_types, :name, :unique => true
  end
end
