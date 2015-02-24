class ChangeModifierToOperationInRequirements < ActiveRecord::Migration
  def change
    rename_column :requirements, :modifier, :operation
  end
end
