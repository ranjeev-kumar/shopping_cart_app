class WishListsController < ApplicationController

  before_action :check_product_in_wish_list, only: [:create]
  before_action :set_wish_lists, only: [:index]

  def index
  end

  def create
    if @wish_product.present?
      flash[:alert] = "This Product is already in wish list.!"
    else
      @wish_product = WishList.create(product_id: params[:product], user_id: current_user.id)
      if @wish_product
        flash[:notice] = "Product added to wish list successfully!"
      else
        flash[:alert] = "Something Went wrong!"
      end
    end
    redirect_to '/' 
  end

  private
    def check_product_in_wish_list
      if user_signed_in?
        @wish_product = WishList.find_by(product_id: params[:product].to_i) 
      else
        redirect_to '/'
        flash[:notice] = "You need to Sign In for add products to cart!"
      end
    end

    def set_wish_lists
    if user_signed_in?
      @wish_lists = current_user.wish_lists.joins(:product).select('products.id, products.name, products.price, products.status')
    else
      @wish_lists = nil
    end
  end
end