class ChangePriceColumnInProductTable < ActiveRecord::Migration
  def change
    remove_column :products, :price, :decimal
    add_column :products, :price, :decimal, precision: 8, scale: 2
  end
end
