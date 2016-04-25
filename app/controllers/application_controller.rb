class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # filters
  before_action :configure_sanitized_params, if: :devise_controller?
  before_action :categories_list
  before_action :set_cart_items

  def configure_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:fname, :lname, :phone, :email, :password)}
  end

  def after_sign_in_path_for(resource)
    dashboards_path
  end

  def after_sign_out_path_for(resource)
    dashboards_path
  end

  def categories_list
    @categories = Category.where(category_id: nil)
  end

  def set_cart_items
    if user_signed_in?
      @cart_products = current_user.cart_items.joins(:product).select('products.id, products.name, cart_items.quantity, cart_items.quantity * products.price as amount, products.price')
      @total_amount = @cart_products.map(&:amount).sum
    else
      @cart_products = nil
    end
  end
end
