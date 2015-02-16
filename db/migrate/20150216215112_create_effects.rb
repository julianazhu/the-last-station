class CreateEffects < ActiveRecord::Migration
  def change
    create_table :effects do |t|
      t.integer :outcome_id
      t.integer :quality_id
      t.string :modifier
      t.integer :amount

      t.timestamps
    end
  end
end
