class UsersController < ApplicationController
  def new
    @user = User.new(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :uni, :password, :password_confirmation)
    end


end
