class Reversechangestostatamountcolumn < ActiveRecord::Migration
  def change
    rename_column :stats, :value, :points
    change_column :stats, :points, :int
  end
end
