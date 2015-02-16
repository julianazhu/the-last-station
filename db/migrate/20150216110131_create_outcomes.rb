class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.integer :story_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
