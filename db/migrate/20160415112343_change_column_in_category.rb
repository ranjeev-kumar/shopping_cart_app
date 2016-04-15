class ChangeColumnInCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :name, :string
    add_column :categories, :status, :string, default: :false
  end
end
