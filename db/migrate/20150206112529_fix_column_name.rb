class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :characters, :characterName, :character_name
  end
end
