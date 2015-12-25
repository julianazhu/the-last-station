class AddFavorTextToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :flavor_text, :text
  end
end
