class AddImagePathToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :image_path, :string
  end
end
