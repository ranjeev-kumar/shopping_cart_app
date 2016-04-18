class ChangeColumnInCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :name, :string
    remove_column :categories, :description, :text
    add_column :categories, :status, :string, default: :false
    add_column :categories, :name, :string
  end
end
