class ChangeTypeToLocationInStories < ActiveRecord::Migration
  def change
    rename_column :stories, :type, :location
  end
end
