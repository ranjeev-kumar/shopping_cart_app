class CreateUserOrders < ActiveRecord::Migration
  def change
    create_table :user_orders do |t|
      t.decimal :total_amount, default: 0.00, precision: 12, scale: 2
      t.decimal :shipping_charge, default: 0.00, precision: 12, scale: 2
      t.string :status, default: :Pending
      t.references :billing_address
      t.references :shipping_address
      t.references :user, index: true
      t.references :payment_gateway, index: true
      t.references :coupon, index: true
      t.timestamps null: false
    end
  end
end
