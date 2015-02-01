class AddTypeToQualities < ActiveRecord::Migration
  def change
    add_column :qualities, :type, :string
  end
end
