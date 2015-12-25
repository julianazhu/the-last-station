class AddHookToStories < ActiveRecord::Migration
  def change
    add_column :stories, :hook, :text
  end
end
