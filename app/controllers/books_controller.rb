class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
    @books = Book.all
    render :index
  end
end

  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def delete
  end

  def edit
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end