class ChangeStatPointsColumnToValue < ActiveRecord::Migration
  def change
    rename_column :stats, :points, :value
    change_column :stats, :value, :string
  end
end
