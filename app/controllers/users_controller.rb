class UsersController < ApplicationController

  def show
     @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

    def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def index
    if @users = User.all
       @user = User.new
       @books = Book.all
       @book = Book.new
    else
      flash.now[:danger] = "Book wasn't successfully show."
      render '/user'
  end
end


  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end