class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(@book)
    @book.user_id = current_user.id
    @book.save
    redirect_to '/books'
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
  end