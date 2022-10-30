class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "You have created book successfully"
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
  　redirect_to  book_path
  end
  end

 def update
    @book = Book.find(params[:id])
  if  @book.user != current_user
    redirect_to book_path
  else
    if @book.update(book_params)
        redirect_to book_path
    else
        render :edit
        flash[:alert] = ""
    end
  end
end

  def destroy
    @book = Book.find(params[:id])
    if @book.user != current_user
       redirect_to  book_path
    else
      @book.destroy
    end
  end

# flash[:notice] = "ログアウトしました"
#     redirect_to '/books'
#     redirect_to root_path

    def book_params
    params.require(:book).permit(:title, :body)
    end

  end