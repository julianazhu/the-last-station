class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :quality_id
      t.integer :amount
      t.text :description
      t.text :image_path
      t.boolean :triangular

      t.timestamps
    end
  end
end
