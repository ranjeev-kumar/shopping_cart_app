class WishLists < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.references :product, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
