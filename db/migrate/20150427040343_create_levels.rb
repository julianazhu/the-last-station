class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :quality_id
      t.integer :amount
      t.string :description
      t.string :image_path
      t.boolean :triangular

      t.timestamps
    end
  end
end
