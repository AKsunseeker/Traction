# == Schema Information
#
# Table name: groups
#
#  id            :integer          not null, primary key
#  name          :string
#  status        :string
#  founding_date :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :destroy, :update]
  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new(group_params)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update
      redirect_to group_path(params[:id])
    else
      render :edit
    end
  end

  def delete
    @group.destroy
    redirect_to groups_path
  end

  private
   def group_params
     params.require(:group).permit(:name, :status, :founding_date)
   end

   def find_group
     @group = group.find(params[:id])
   end
end
