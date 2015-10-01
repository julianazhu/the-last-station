class AddAvatarImagaePathToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :avatar_image_path, :string
  end
end
