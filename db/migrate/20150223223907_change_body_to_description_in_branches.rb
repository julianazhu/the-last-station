class ChangeBodyToDescriptionInBranches < ActiveRecord::Migration
  def change
    rename_column :branches, :body, :description
  end
end
