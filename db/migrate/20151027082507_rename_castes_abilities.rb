class RenameCastesAbilities < ActiveRecord::Migration
  def change
    rename_table :castes_abilities, :abilities_castes
  end
end
