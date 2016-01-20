# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  lat         :float
#  long        :float
#  street      :string
#  city        :string
#  state       :string
#  zip         :string
#  user_id     :integer
#  group_id    :integer
#  workout_id  :integer
#  exercise_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :destroy, :update]
  
  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end

  private
    def location_params
      params.require(:location).permit(:lat, :long, :street, :city, :state, :zip, :user_id, :group_id, :workout_id, :exercise_id)
    end

    def find_location
      @location = Location.find(params[:id])
    end
end