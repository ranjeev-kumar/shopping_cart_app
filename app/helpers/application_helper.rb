module ApplicationHelper
  def item_counts
    if user_signed_in?
      item_count = CartItem.pluck(:quantity).sum
    else
      itme_count = 0
    end
  end

  def coupons_list
    coupons = Coupon.all.collect {|c| [ c.code, c.id ] }
  end

  def email_list
    emails = User.where(newsletter: :true).collect {|u| [ u.email ] }
  end

end
