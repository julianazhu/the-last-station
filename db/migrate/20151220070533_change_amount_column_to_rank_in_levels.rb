class ChangeAmountColumnToRankInLevels < ActiveRecord::Migration
  def change
    rename_column :levels, :amount, :rank
  end
end
