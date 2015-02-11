class CreateCharacterStats < ActiveRecord::Migration
  def change
    create_table :character_stats do |t|
      t.integer :character_id
      t.integer :quality_id
      t.integer :points

      t.timestamps
    end
  end
end
