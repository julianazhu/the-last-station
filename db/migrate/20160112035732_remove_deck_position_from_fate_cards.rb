class RemoveDeckPositionFromFateCards < ActiveRecord::Migration
  def up
    remove_column :fate_cards, :deck_position, :integer
  end
  def down
    add_column :fate_cards, :deck_position, :integer
  end
end
