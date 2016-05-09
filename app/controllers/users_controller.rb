class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:alert] = "Profile updated sucessfully!"
      redirect_to edit_user_path
    else
      flash[:alert] = "Something went wrong, Try again!"
      render 'edit'
    end
  end

  private
    def set_user
      @user = User.find_by(id:current_user.id)
    end

    def user_params
      params.require(:user).permit(:fname, :lname, :phone, :status, :email, :password)
    end
end
