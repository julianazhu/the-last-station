class ChangeForeignIdFormatInBranches < ActiveRecord::Migration
  def change
    change_column :branches, :story_id, :integer, :limit => nil
  end
end
