class ProductsController < ApplicationController

  # Filters
  before_action :set_product, only: [:show]

  # Actions
  def show
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
