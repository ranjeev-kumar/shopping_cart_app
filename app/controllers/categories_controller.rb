class CategoriesController < ApplicationController

  def show
    category = Category.find(params[:id])
    if category.category_id
      @products = category.products
    else
      @products = Product.joins(:categories).where('categories.category_id = ?', params[:id])
    end
    @products = @products.paginate(page: params[:page], per_page: 1)
  end

end
