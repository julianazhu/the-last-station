class CreateFateCards < ActiveRecord::Migration
  def change
    create_table :fate_cards do |t|
      t.integer  "character_id"
      t.integer  "story_id"
      t.timestamps
    end
  end
end
