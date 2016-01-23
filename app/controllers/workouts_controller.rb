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
  before_action :find_workout, only: [:show, :update, :edit, :destroy, :add_workout]
  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else
      redirect_to :new
    end
  end

  def edit    
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

  def add_workout
    new_workout = current_user.workouts.create(name: @workout.name)
    new_exercises = @workout.exercises.all
    new_exercises.each do |exercise|
      new_exercise = new_workout.exercises.new
      new_exercise.name = exercise.name 
      new_exercise.weight = exercise.weight
      new_exercise.repetitions = exercise.repetitions
      new_exercise.repetition_duration_seconds = exercise.repetition_duration_seconds
      new_exercise.rest_duration_seconds = exercise.rest_duration_seconds
      new_exercise.save
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :complete)
  end

  def find_workout
    @workout = Workout.find(params[:id])
  end
end
