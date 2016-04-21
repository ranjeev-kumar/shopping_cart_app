class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 0
      t.references :product, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
