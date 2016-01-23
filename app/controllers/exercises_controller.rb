# == Schema Information
#
# Table name: exercises
#
#  id                          :integer          not null, primary key
#  name                        :string
#  weight                      :float
#  repetitions                 :integer
#  repetition_duration_seconds :integer
#  rest_duration_seconds       :integer
#  complete                    :boolean
#  workout_id                  :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class ExercisesController < ApplicationController
  before_action :find_workout
  before_action :find_exercise, except: [:index, :new, :create]
  def index
    @exercises = Exercise.all
  end

  def show
  end
  
  def new
    @exercise = @workout.exercises.new
  end
  
  def create
    @exercise = @workout.exercises.new(exercise_params)
    if @exercise.save
      redirect_to workout_path(@workout)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @exercise.update
      redirect_to workout_exercise_path(@workout, @exercise)
    else
      render :edit
    end
  end
  
  def destroy
    @exercise.destroy
    redirect_to workout_path(@workout)
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :weight, :repitions, :repetition_duration_seconds, :rest_duration_seconds, :complete, :workout_id)
  end

  def find_workout
    @workout = Workout.find(params[:workout_id])
  end
  def find_exercise
    @exercise = @workout.exercises.find(params[:id])
  end
end
