class AddRankedToQualities < ActiveRecord::Migration
  def change
    add_column :qualities, :ranked, :boolean
  end
end
