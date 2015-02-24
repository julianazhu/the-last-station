class ChangeModifierToOperationInEffects < ActiveRecord::Migration
  def change
    rename_column :effects, :modifier, :operation
  end
end
