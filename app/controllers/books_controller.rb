class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
     @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to books_path, notice: "Book was successfully updated."
  else
    flash.now[:danger] = "Book wasn't successfully updated."
    render edit_book_path
  end
end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

    def book_params
    params.require(:book).permit(:title, :body)
  end

  end