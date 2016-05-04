class UserOrdersController < ApplicationController

  before_action :set_cart_items, only: [:index, :confirm_order]

  def index
    @addresses = current_user.addresses
  end

  def confirm_order
    order_details = []
    user_order = current_user.user_orders.build(total_amount: @total_amount, billing_address_id: params[:address].to_i, shipping_address_id: params[:address].to_i)
    @cart_products.each do |cart_product|
      order_details << user_order.order_details.build(product_id: cart_product.id, quantity:cart_product.quantity, amount: cart_product.amount)
    end
    user_order.order_details = order_details
    if user_order.save
      NotificationMailer.order_status_email(user_order, current_user).deliver_now
      flash[:notice] = "Address added successfully!"
      redirect_to user_orders_path
    else
      flash[:alert] = "Something went wrong, Try again!"
      redirect_to cart_items_path
    end
  end
  
end
