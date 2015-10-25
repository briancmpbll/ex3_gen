class CasteForeignKey < ActiveRecord::Migration
  def change
    add_column :castes, :character_type_id, :integer
    add_foreign_key :castes, :character_types
  end
end
