class PaymentGatewaysController < ApplicationController
  
  # before_action :set_order, only: [:create]

  def new
    order = UserOrder.find(params[:user_order_id])
    unless order.shipping_address_id == nil
      @payment_gateway = PaymentGateway.new(user_order_id: params[:user_order_id].to_i)
    else
      redirect_to user_order_path(params[:user_order_id].to_i)
      flash[:notice] = "Please add address for shipping produt(s).!"
    end
  end

  def create
    order = UserOrder.find(params[:payment_gateway][:user_order_id])
    # Convert INR to CENT
    @amount = (order.total_amount * 1.5).to_i

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
    redirect_to root_path
    flash[:notice] = "Thank you for Shopping.!"
    current_user.cart_items.destroy_all
  rescue Stripe::CardError => e
    flash[:notice] = e.message
    redirect_to new_payment_gateway_path(user_order_id: params[:payment_gateway][:user_order_id])
  end

  # def set_order
  #   order = UserOrder.find(params[:user_order_id])
  # end
end
