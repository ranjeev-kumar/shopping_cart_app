class ChangeColumnInImage < ActiveRecord::Migration
  def change
    remove_column :images, :main, :string
    remove_column :images, :image_size, :integer
    add_column :images, :main, :boolean, default: :false
  end
end
