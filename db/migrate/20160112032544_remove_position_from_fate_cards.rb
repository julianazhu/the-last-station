class RemovePositionFromFateCards < ActiveRecord::Migration
  def up
    remove_column :fate_cards, :position
  end

  def down
    add_column :fate_cards, :position, :integer
  end
end
