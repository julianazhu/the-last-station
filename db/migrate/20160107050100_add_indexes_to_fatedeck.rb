class AddIndexesToFatedeck < ActiveRecord::Migration
  def change
    add_index :fate_decks, :character_id
    add_index :fate_decks, :story_id
  end
end
