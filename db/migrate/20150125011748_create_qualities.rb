class CreateQualities < ActiveRecord::Migration
  def change
    create_table :qualities do |t|
      t.string :name
      t.text :description
      t.text :imagelink
      t.integer :points
      t.belongs_to :character, index: true

      t.timestamps
    end
  end
end
