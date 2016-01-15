class ChangeTypeToCategoryInQualities < ActiveRecord::Migration
  def change
    rename_column :qualities, :type, :category
  end
end
