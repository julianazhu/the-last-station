class ChangeForeignIdFormatInEffects < ActiveRecord::Migration
  def change
    change_column :effects, :branch_id, :integer, :limit => nil
    change_column :effects, :quality_id, :integer, :limit => nil
  end
end
