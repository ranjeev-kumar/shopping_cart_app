class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # filters
  before_action :configure_sanitized_params, if: :devise_controller?
  before_action :categories_list

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

end
