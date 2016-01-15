class DropFateDecks < ActiveRecord::Migration
  def change
    drop_table :fate_decks
  end
end
