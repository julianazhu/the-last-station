class CreateBranchRequirements < ActiveRecord::Migration
  def change
    create_table :branch_requirements do |t|
      t.integer :branch_id
      t.integer :quality_id
      t.string :operation
      t.integer :points

      t.timestamps
    end
  end
end
