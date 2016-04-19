class DashboardsController < ApplicationController

  def index      
    @products = Product.all.paginate(page: params[:page], per_page: 1)
  end
end
