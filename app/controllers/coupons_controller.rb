class CouponsController < ApplicationController

  def apply_discount
    @coupon = Coupon.find(params[:id])
  end
end
