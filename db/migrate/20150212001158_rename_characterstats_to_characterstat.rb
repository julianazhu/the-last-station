class RenameCharacterstatsToCharacterstat < ActiveRecord::Migration
  def self.up
    rename_table :character_stats, :character_stat
  end
  def self.down
  rename_table :character_stat, :character_stats
  end
end
