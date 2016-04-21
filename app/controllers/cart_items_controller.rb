class CartItemsController < ApplicationController

  # Actions
  def index
    @cart_products = current_user.cart_items.joins(:product).select('products.id, products.name, cart_items.quantity, cart_items.quantity * products.price as amount, products.price')
  end

  def update
    @cart_item = CartItem.where(product_id: params[:id])
  end

  def add_product
    @cart_item = CartItem.new(product_id: params[:id], user_id: current_user.id, quantity: 1)
    if @cart_item.save
      flash[:notice] = "Product added successfully!"
    else
      flash[:alert] = "Something Went wrong!"
    end
    redirect_to dashboards_path    
  end
end
