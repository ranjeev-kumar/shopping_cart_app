class UserOrdersController < ApplicationController

  before_action :set_cart_items, only: [:show, :confirm_order]
  before_action :set_user_order, only: [:add_order_address, :apply_discount]
  before_action :set_discount, only: [:show]
  before_action :create_user_order, only: [:confirm_order]

  def index
    @user_orders = current_user.user_orders.paginate(page: params[:page], per_page: 10)
  end

  def show
    @addresses = current_user.addresses
  end

  def confirm_order
    if @user_order.save
      # NotificationMailer.order_status_email(user_order, current_user).deliver_now
      redirect_to user_order_path(@user_order)
    else
      flash[:alert] = "Something went wrong, Try again!"
      redirect_to cart_items_path
    end
  end

  def add_order_address
    if @user_order.update(billing_address_id: params[:address].to_i, shipping_address_id: params[:address].to_i)
      flash[:notice] = "Address added successfully!"
    else
      flash[:alert] = "Something went wrong, Try again!"
    end
    redirect_to user_order_path(@user_order)
  end

  def apply_discount
    if @user_order.update(coupon_id: params[:coupon_id].to_i)
      flash[:notice] = "Coupon Applied Successfully!"
    else
      flash[:alert] = "Something went wrong, Try again!"
    end
    redirect_to user_order_path(@user_order)
  end

  private
    def create_user_order
      order_details = []
      @user_order = current_user.user_orders.build(total_amount: @total_amount)
      @cart_products.each do |cart_product|
        order_details << @user_order.order_details.build(product_id: cart_product.id, quantity:cart_product.quantity, amount: cart_product.amount)
      end
      @user_order.order_details = order_details
    end
    
    def set_user_order
      @user_order = UserOrder.find(params[:order_id])
    end

    def set_discount
      user_order = UserOrder.find(params[:id])
      if user_order.coupon.present?
        @discount = (user_order.coupon.discount_of/100).to_f
      else
        @discount = 0.0
      end
    end
  
end
