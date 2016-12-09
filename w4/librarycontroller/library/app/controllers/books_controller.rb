class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book && @book.save
      redirect_to books_url
    else
      :new
    end
  end

  def destroy
    @book = Book.find_by_id(params[:id])
    @book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :id)
  end
end
