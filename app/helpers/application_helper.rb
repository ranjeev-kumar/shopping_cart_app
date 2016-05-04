module ApplicationHelper
  def item_counts
    if user_signed_in?
      item_count = CartItem.pluck(:quantity).sum
    else
      itme_count = 0
    end
  end

end
