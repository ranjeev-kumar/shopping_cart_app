class CartItemsController < ApplicationController
  before_action :check_product_in_cart, only: [:add_product]
  before_action :set_cart_items, only: [:index]
  # Actions
  def index
  end

  def show
  end

  def add_product
    if @cart_item.save
        flash[:notice] = "Product added successfully!"
      else
        flash[:alert] = "Something Went wrong!"
      end
      @cart_products = current_user.cart_items.joins(:product).select('products.id, products.name, cart_items.quantity, cart_items.quantity * products.price as amount, products.price')
      @total_amount = @cart_products.map(&:amount).sum
    end
  end

  def destroy
    @item = CartItem.find_by(product_id: params[:id])
    if @item.destroy
      flash[:notice] = "Product removed sucessfully!"
    else
      flash[:alert] = "Something went wrong, Try again!"
    end
    redirect_to cart_items_path
  end

  def clear_cart
    current_user.cart_items.destroy_all
    redirect_to payment_gateways_path
  end

  private
    def check_product_in_cart
      if user_signed_in?
      @cart_item = CartItem.find_by(product_id: params[:id])
      if @cart_item.present?
        @cart_item.quantity += 1
      else
        @cart_item = CartItem.new(product_id: params[:id], user_id: current_user.id, quantity: 1)
      end
    else
      respond_to do |format|
        format.js
      end
    end
end
