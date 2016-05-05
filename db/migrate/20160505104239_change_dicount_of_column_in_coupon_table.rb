class ChangeDicountOfColumnInCouponTable < ActiveRecord::Migration
  def change
    remove_column :coupons, :dicount_of, :decimal
    add_column :coupons, :discount_of, :decimal, precision: 5, scale: 2
  end
end
