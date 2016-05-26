class OrderDetailsController < ApplicationController

  before_action :set_order_history, only: [:index]

  def index 
  end

  def set_order_history
    @order = UserOrder.find(params[:order_id])
    order_details = @order.order_details
    @order_history = order_details.joins(:product).select('products.id, products.name, order_details.quantity, products.price, order_details.quantity * products.price as amount')
    @amount = @order_history.map(&:amount).sum
  end
end
