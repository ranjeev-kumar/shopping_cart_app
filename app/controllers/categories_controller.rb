class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    if @category.try(:category_id)
      @products = @category.products
    else
      @products = Product.category_products(params[:id])
    end
    @products = @products.paginate(page: params[:page], per_page: 6)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

end
