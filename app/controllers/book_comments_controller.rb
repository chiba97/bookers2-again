class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(bookcomment_params)
    @comment.book_id = @book.id
    @comment.save
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    @book = Book.find(params[:book_id])
  end

  private

  def bookcomment_params
    params.require(:book_comment).permit(:comment)
  end
end
