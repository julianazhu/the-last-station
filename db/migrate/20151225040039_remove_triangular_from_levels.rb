class RemoveTriangularFromLevels < ActiveRecord::Migration
  def change
    remove_column :levels, :triangular
  end
end
