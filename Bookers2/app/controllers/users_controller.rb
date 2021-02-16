class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
  end

    private

  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end