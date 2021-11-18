class UsersController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books

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
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def followings
    user = User.find(params[:id])
    @user = user.followings
  end

  def followers
    user = User.find(params[:id])
    @user = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
