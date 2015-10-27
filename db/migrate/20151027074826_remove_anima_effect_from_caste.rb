class RemoveAnimaEffectFromCaste < ActiveRecord::Migration
  def change
    remove_column :castes, :anima_effect, :string

    create_table :anima_effects do |t|
      t.belongs_to :character_type, null: false, index: true
      t.belongs_to :caste, index: true
      t.string :condition, null: false
      t.string :effect, null: false

      t.timestamps null: false
    end

    add_foreign_key :anima_effects, :character_types
    add_foreign_key :anima_effects, :castes
  end
end
