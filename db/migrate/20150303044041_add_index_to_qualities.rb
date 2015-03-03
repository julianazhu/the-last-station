class AddIndexToQualities < ActiveRecord::Migration
  def change
    change_column :qualities, :character_id, :string
    add_index :qualities, :character_id
  end
end
