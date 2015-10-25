class CreateCastes < ActiveRecord::Migration
  def change
    create_table :castes do |t|
      t.string :name, null: false
      t.string :anima_effect, null: false

      t.timestamps null: false
    end
  end
end
