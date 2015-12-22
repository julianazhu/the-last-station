class ChangeAmountColumnToPointsInRequirements < ActiveRecord::Migration
  def change
    rename_column :requirements, :amount, :points
  end
end
