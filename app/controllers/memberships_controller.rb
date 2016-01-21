# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  join_date  :date
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MembershipsController < ApplicationController
  before_action :find_membership, only: [:show, :edit, :destroy, :update]
  def index
    @memberships = Membership.all
  end

  def show
  end

  def new
    @membership = Membership.new(membership_params)
  end

  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      redirect_to memberships_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @membership.update
      redirect_to membership_path(params[:id])
    else
      render :edit
    end
  end

  def delete
    @membership.destroy
    redirect_to memberships_path
  end

  private
   def membership_params
     params.require(:membership).permit(:join_date, :user_id, :group_id)
   end

   def find_membership
     @membership = Membership.find(params[:id])
   end
end
