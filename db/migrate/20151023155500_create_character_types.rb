class CreateCharacterTypes < ActiveRecord::Migration
  def change
    create_table :character_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
