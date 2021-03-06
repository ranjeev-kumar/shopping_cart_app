class AddressesController < ApplicationController

  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @addresses = current_user.addresses
  end

  def edit
  end

  def new
    @address = Address.new
  end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      flash[:alert] = "Address saved sucessfully!"
      if params[:order_id] == ""
        redirect_to addresses_path
      else
        redirect_to user_order_path(params[:order_id])
      end
    else
      flash[:alert] = "Something went wrong, Try again!"
      render 'new'
    end
  end

  def update
    if @address.update(address_params)
      flash[:alert] = "Your address updated sucessfully!"
      redirect_to user_orders_path
    else
      flash[:alert] = "Something went wrong, Try again!"
    end
  end

  def destroy
    if @address.destroy
      flash[:alert] = "Address removed sucessfully!"
    else
      flash[:alert] = "Something went wrong, Try again!"
    end
  end

  private
    def address_params
      params.require(:address).permit(:address_1, :address_2, :city, :state, :country, :zipcode)
    end

    def set_address
      @address = Address.find(params[:id])
    end
end