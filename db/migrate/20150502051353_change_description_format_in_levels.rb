class ChangeDescriptionFormatInLevels < ActiveRecord::Migration
  def change
    change_column :levels, :description, :string
  end
end
