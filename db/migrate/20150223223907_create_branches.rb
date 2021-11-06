class CreateBranches < ActiveRecord::Migration
  def change
    create_table "branches" do |t|
      t.integer  "story_id"
      t.text     "title"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "outcome"
      t.text     "image_path"
    end
  end
end
