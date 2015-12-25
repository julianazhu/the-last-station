class ChangeForeignIdFormatInRequirements < ActiveRecord::Migration
  def change
    change_column :requirements, :story_id, :integer, :limit => nil
    change_column :requirements, :quality_id, :integer, :limit => nil
  end
end
