class RemoveTypeFromImage < ActiveRecord::Migration
  def change
    remove_column :images, :type
  end
end
