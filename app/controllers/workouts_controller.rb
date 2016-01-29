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
  before_action :find_workout, only: [:show, :update, :edit, :destroy, :add_workout, :do_workout, :finish]
  
  def index
    @workouts = Workout.where(original: true)
  end

  def show
  end

  def new
    @workout = Workout.new
    @categories = Category.all
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    if @workout.save
      @workout.creator_id=  @workout.id
      @workout.original = true
      @workout.complete = false
      @workout.save
      # @@original_workouts << @workout
      redirect_to workout_path(@workout)
    else
      redirect_to :new
    end
  end

  def edit    
    @category = Category.all
  end

  def update
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      redirect_to :edit
    end
  end

  def finish
    if @workout.update(complete: true)
      redirect_to root_path
    else
      render :edit
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
    new_workout = current_user.workouts.new
    new_workout.name = @workout.name
    new_workout.creator_id = @workout.creator_id
    new_workout.complete = false
    new_workout.original = false
    new_workout.save
    new_exercises = @workout.exercises.all
    binding.pry
    new_exercises.each do |exercise|
      new_exercise = new_workout.exercises.new
      new_exercise.name = exercise.name 
      new_exercise.weight = exercise.weight
      new_exercise.repetitions = exercise.repetitions
      new_exercise.repetition_duration_seconds = exercise.repetition_duration_seconds
      new_exercise.rest_duration_seconds = exercise.rest_duration_seconds
      new_exercise.youtube_url = exercise.youtube_url
      new_exercise.save
    end
    render 'welcome/show'
  end

  def do_workout
    new_workout = current_user.workouts.new
    new_workout.name = @workout.name
    new_workout.creator_id = @workout.creator_id
    new_workout.original = false
    new_workout.save
    new_exercises = @workout.exercises.all
    new_exercises.each do |exercise|
      new_exercise = new_workout.exercises.new
      new_exercise.name = exercise.name 
      new_exercise.weight = exercise.weight
      new_exercise.repetitions = exercise.repetitions
      new_exercise.repetition_duration_seconds = exercise.repetition_duration_seconds
      new_exercise.rest_duration_seconds = exercise.rest_duration_seconds
      new_exercise.youtube_url = exercise.youtube_url
      new_exercise.save
    end
    redirect_to workout_path(new_workout)
  end

  def get_exercise_progress
    workout_list = []
    workouts = current_user.workouts.where(complete: true).where(creator_id: params[:creator_id])
    workouts.map do |workout|
      workout_list.push({
        date: workout.updated_at,
        workout_progress: workout.like_exercises(workout.exercises)
        })

    end

    @line_hashes = []
    @dates_array = []
    workout_list.each do |workout|
      @dates_array << workout[:date]
    end
    workout_list.first[:workout_progress].each do |w|
      @line_hashes << {w[:name] => []}
    end
    workout_list.each do |workout|
      @i = 0
      workout[:workout_progress].each do |w|
        @line_hashes[@i][w[:name]] << w[:sum]
        @i += 1
      end
    end
    json_data = [@line_hashes, @dates_array]
    render json: json_data
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :complete, :category_id)
  end

  def find_workout
    @workout = Workout.find(params[:id])
  end
end
