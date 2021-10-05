class BooksController < ApplicationController
  
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  
  private 
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
