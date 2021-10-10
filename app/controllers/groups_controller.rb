class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
    if @group.save
       redirect_to groups_path, notice: "You have created group successfully."
    else
      render :new
    end
  end
  
  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to groups_path
  end

  def index
    @groups = Group.all
    @user = current_user
    @book = Book.new
  end

  def show
    @group =Group.find(params[:id])
    @user = current_user
    @book = Book.new
  end

  def edit
    @group = Group.find(params[:id])
    if @group.owner_id != current_user.id
       redirect_to groups_path
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.users.delete(current_user)
    redirect_to groups_path
  end

  def update
    @group = Group.find(params[:id])
    @group.owner_id = current_user.id
    if @group = @group.update(group_params)
       redirect_to groups_path, notice: "You have updated group successfully."
    else
      render :edit
    end
  end
  
  def new_mail
    @group = Group.find(params[:group_id])
  end
  
  def send_mail
    @group = Group.find(params[:group_id])
    group_users = @group.users
    @title = params[:title]
    @content = params[:content]
    EventMailer.send_mail(group_users, @title, @content).deliver
  end

  private
  def group_params
    params.require(:group).permit(:name,:introduction,:image)
  end

end
