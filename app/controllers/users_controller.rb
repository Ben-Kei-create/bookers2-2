class UsersController < ApplicationController

  def show
     @user = User.find(params[:id])
     @books = @user.books
     @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  unless @user == current_user
    redirect_to user_path(current_user)
  end
  end

 def update
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(@user)
    end

    if @user.update(user_params)
      flash[:notice] = "You have updateed user successfully"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "You haven't updateed book successfully"
      render :edit
  end
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
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end