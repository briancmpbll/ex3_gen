class CreateAttributeCategories < ActiveRecord::Migration
  def change
    create_table :attribute_categories do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :attribute_categories, :name, unique: true
  end
end
