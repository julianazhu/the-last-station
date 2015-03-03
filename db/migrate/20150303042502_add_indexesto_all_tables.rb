class AddIndexestoAllTables < ActiveRecord::Migration
  def change
    change_column :stats, :character_id, :string
    add_index :stats, :character_id

    change_column :stats, :quality_id, :string
    add_index :stats, :quality_id

    change_column :requirements, :story_id, :string
    add_index :requirements, :story_id

    change_column :requirements, :quality_id, :string
    add_index :requirements, :quality_id

    change_column :branches, :story_id, :string
    add_index :branches, :story_id

    change_column :effects, :branch_id, :string
    add_index :effects, :branch_id    

    change_column :effects, :quality_id, :string
    add_index :effects, :quality_id    
  end
end
