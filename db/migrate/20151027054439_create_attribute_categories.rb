class CreateAttributeCategories < ActiveRecord::Migration
  def change
    create_table :attribute_categories do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :attribute_categories, :name, unique: true

    create_table :character_attributes do |t|
      t.belongs_to :attribute_category, index: true
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :character_attributes, :name, unique: true
    add_foreign_key :character_attributes, :attribute_categories

  end
end
