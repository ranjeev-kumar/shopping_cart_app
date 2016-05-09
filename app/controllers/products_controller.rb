class ProductsController < ApplicationController

  # Filters
  before_action :set_product, only: [:show]

  # Actions
  def show
  end

  def search_product
    if params[:search]
      @products = Product.where('name LIKE ?', params[:search]).paginate(page: params[:page], per_page: 8)
      unless @products.present?
        flash[:alert] = "#{params[:search]} is not available this time."
        render 'dashboards/index'
      end
    else
      flash[:alert] = "Enter Product name and Try again!"
      redirect_to '/'
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
