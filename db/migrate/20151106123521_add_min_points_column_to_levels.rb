class AddMinPointsColumnToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :minimum_points, :integer
  end
end
