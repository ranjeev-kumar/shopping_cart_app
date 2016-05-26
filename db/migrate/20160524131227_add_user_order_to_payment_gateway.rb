class AddUserOrderToPaymentGateway < ActiveRecord::Migration
  def change
    add_column :payment_gateways, :user_order_id, :integer, index: true
  end
end
