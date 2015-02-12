class ChangeCharacterCharacterNameColumnToName < ActiveRecord::Migration
  def change
        rename_column :characters, :character_name, :name
  end
end
