class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # filters
  before_action :configure_sanitized_params, if: :devise_controller?
  before_action :categories_list
  before_action :set_cart_items
  before_action :wish_list_counts

  def configure_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:fname, :lname, :phone, :status, :email, :password)}
  end

  def categories_list
    @categories = Category.where(category_id: nil).order('id ASC')
  end

  def set_cart_items
    if user_signed_in?
      @cart_products = current_user.cart_items.joins(:product).select('products.id, products.name, cart_items.quantity, cart_items.quantity * products.price as amount, products.price')
      @total_amount = @cart_products.map(&:amount).sum
    else
      @cart_products = nil
    end
  end

  def wish_list_counts
    if user_signed_in?
      @list_count = current_user.wish_lists.count
    else
      @list_count = nil
    end
  end
end
