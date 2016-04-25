class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :quantity, default: 0
      t.decimal :amount, precision: 12, scale: 2
      t.references :product, index: true
      t.references :user_order, index: true
      t.timestamps null: false
    end
  end
end
