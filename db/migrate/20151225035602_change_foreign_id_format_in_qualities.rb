class ChangeForeignIdFormatInQualities < ActiveRecord::Migration
  def change
    change_column :qualities, :character_id, :integer, :limit => nil
  end
end
