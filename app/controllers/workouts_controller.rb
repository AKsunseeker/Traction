# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  creator_id :integer
#  name       :string
#  complete   :boolean
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :update, :edit, :destroy]
  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new(workout_params)
  end

  def show
    @workout = Workout.find(workout_params)
  end

  def edit
    
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else
      redirect_to :new
    end
  end

  def update
    if @workout.save
      redirect_to workout_path(@workout)
    else
      redirect_to :edit
    end
  end

  def destroy
    if @workout.destroy
      redirect_to workout_path
    else
      redirect_to workout_path(@workout)
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :complete)
  end

  def find_workouts
    @workout = Workout.find(workout_params)
  end
end
