class BooksController < ApplicationController
  def index
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    @user = current_user
    @book = Book.new
    if params[:sort_create]
      @books = Book.latest
    elsif params[:sort_rate]
      @books = Book.rating
    else
      @books = Book.all.
        sort do |a, b|
          b.favorited_users.where(created_at: from...to).size <=>
          a.favorited_users.where(created_at: from...to).size
        end
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment = BookComment.new

    unless ViewCount.find_by(user_id: current_user.id, book_id: @book.id)
      current_user.view_counts.create(book_id: @book.id)
    end

    # 下記dm機能
    @currentRoomUser = Entry.where(user_id: current_user.id)
    @receiveUser = Entry.where(user_id: @user.id)

    unless @user.id == current_user.id
      @currentRoomUser.each do |cu|
        @receiveUser.each do |u|
          if cu.room_id == u.room_id
            @haveRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @haveRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def search_book
    @book = Book.new
    @user = current_user
    @books = Book.search(params[:keyword])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :rate, :category)
  end
end
