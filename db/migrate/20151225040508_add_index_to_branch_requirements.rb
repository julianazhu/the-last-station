class AddIndexToBranchRequirements < ActiveRecord::Migration
  def change
    add_index :branch_requirements, :branch_id
    add_index :branch_requirements, :quality_id
  end
end

