class CreateUserOrders < ActiveRecord::Migration
  def change
    create_table :user_orders do |t|
      t.integer :quantity, default: 0
      t.decimal :total_amount, precision: 12, scale: 2
      t.decimal :shipping_charge, precision: 12, scale: 2
      t.string :status, default: :pending
      t.references :billing_address
      t.references :shipping_address
      t.references :user, index: true
      t.references :payment_gateway, index: true
      t.references :coupon, index: true
      t.timestamps null: false
    end
  end
end
