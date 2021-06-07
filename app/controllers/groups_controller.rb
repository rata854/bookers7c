class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
  end
  
  def index
    @groups = Group.all
    @book = Book.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end
end