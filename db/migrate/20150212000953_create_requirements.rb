class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.integer :story_id
      t.integer :quality_id
      t.string :modifier
      t.integer :amount

      t.timestamps
    end
  end
end
