class UsersController < ApplicationController
   before_action :correct_user, only: [:edit,:update,]

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
  end

  def index
    @users = User.all
    @book = Book.new
    @user = User.find_by(id: current_user.id)
  end

  def edit
    @user =User.find(params[:id])
    flash[:notice] = "You have updated user successfully"
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
    private

  def correct_user
    user = User.find(params[:id])
  if current_user != user
      redirect_to user_path(current_user.id)
  end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end