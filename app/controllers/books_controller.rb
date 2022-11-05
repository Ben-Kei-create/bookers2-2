class BooksController < ApplicationController

  def new
  end

  # def create
  #   @book = Book.new(book_params)
  #   if @book.user_id = current_user.id
  #     @book.save
  #     flash[:notice] = "You have created book successfully"
  #     redirect_to book_path(@book.id)
  #   else
  #     flash.now[:danger] = "You haven't created book successfully"
  #     render :index
  # end
  # end

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
   flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book)
  else
   flash.now[:danger] = "You haven't created book successfully"
   @books = Book.all
   render :index
  end
 end


  def index
    @books = Book.all
    @book = Book.new
  end

  def show
   @books = Book.find(params[:id])
   @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  unless @book.user == current_user
    redirect_to books_path
end
  end

 def update
    @book = Book.find(params[:id])
  if @book.user != current_user
      redirect_to book_path
  end

  if @book.update(book_params)
       flash[:notice] = "You have updateed book successfully"
        redirect_to book_path
  else
       flash.now[:danger] = "You haven't updateed book successfully"
       render :edit
  end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user != current_user
       redirect_to  book_path(@book)
    else
      @book.destroy
      flash[:success] = "You have destroyed book successfully"
      redirect_to  books_path
    end
  end

    def book_params
    params.require(:book).permit(:title, :body)
    end
    end