module ApplicationHelper
  def item_counts
    item_count = CartItem.all.where(user_id: current_user.id).count
  end
end
