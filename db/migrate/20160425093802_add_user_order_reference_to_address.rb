class AddUserOrderReferenceToAddress < ActiveRecord::Migration
  def change
    add_column :user_orders, :user_order_id, :integer, index: true
  end
end
