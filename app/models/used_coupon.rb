class UsedCoupon < ActiveRecord::Base
  belongs_to :user
  belongs_to :coupons
end
