class CreateFateDecks < ActiveRecord::Migration
  def change
    create_table :fate_decks do |t|
      t.integer :character_id
      t.integer :story_id
      t.integer :position

      t.timestamps
    end
  end
end
