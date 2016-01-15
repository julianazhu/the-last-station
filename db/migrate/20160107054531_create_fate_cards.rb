class CreateFateCards < ActiveRecord::Migration
  def change
    create_table :fate_cards do |t|
      t.string :character_id
      t.string :story_id
      t.integer :deck_position

      t.timestamps
    end
    add_index :fate_cards, :character_id
    add_index :fate_cards, :story_id
  end
end
