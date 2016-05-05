class Coupon < ActiveRecord::Base
  has_many :user_orders
  has_many :used_coupons
  has_many :users, through: :used_coupons
end
