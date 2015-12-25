class ChangeForeignIdFormatInStats < ActiveRecord::Migration
  def change
    change_column :stats, :character_id, :integer, :limit => nil
    change_column :stats, :quality_id, :integer, :limit => nil
  end
end
