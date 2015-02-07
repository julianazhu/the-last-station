class FixQualitiesColumnName < ActiveRecord::Migration
  def change
      rename_column :qualities, :imagelink, :image_path
  end
end
