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
# validation for having category

class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :update, :edit, :destroy, :add_workout, :do_workout, :finish, :workout_history]
  
  def index
    @workouts_original = Workout.where(original: true).order(:created_by_user).page(params[:page])
    @workouts = @workouts_original.where(nil)
    @workouts = @workouts.workout_name(params[:workout_name].downcase) if params[:workout_name].present?
    if current_user
      @user_creator_ids = current_user.workouts.map(&:creator_id).compact
    else
      @current_creator_ids = []
    end
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
      @workout.created_by_user=  current_user.id
      @workout.original = true
      @workout.complete = false
      @workout.save
      redirect_to workout_path(@workout)
    else
      render :new
    end
  end

  def edit    
    @category = Category.all
  end

  def update
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      render :edit
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
    @workout.destroy
    redirect_to workout_path
  end

  def add_workout
    new_workout = current_user.workouts.create
    new_workout.name = @workout.name
    new_workout.creator_id = @workout.creator_id
    new_workout.category_id = @workout.category_id
    new_workout.complete = false
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
    redirect_to root_path
  end

  def do_workout
    new_workout = current_user.workouts.new
    new_workout.name = @workout.name
    new_workout.creator_id = @workout.creator_id
    new_workout.category_id = @workout.category_id
    new_workout.schedule_date = @workout.schedule_date
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

  def remove_workout
    workout = Workout.find(params[:id])
    workout.destroy
    redirect_to root_path
  end

  def delete_workout
    workout = Workout.find(params[:id])
    workout.destroy
    redirect_to workouts_path
  end

  def get_exercise_progress
    workout_list = []
    workouts = current_user.workouts.where(complete: true).where(creator_id: params[:creator_id])
    if workouts.first.exercises
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
  end

  def workout_history
    @workouts = Workout.where(creator_id: @workout.creator_id)
    @exercise_names = []
    @exercise_details = []
    # @exercise_names_details = {}      (names are keys, details are arrays that are values)
    # assign each exercise name to be a key in the hash
    # assign each value of the key to be an array of the details
    # shovel new details onto appropriate array
    @workouts.each do |workout|
      workout.exercises.all.each do |exercise|
        # exercise_name_details[:exercise] = [] <- this is where details will go
        # another loop inside to shovel appropriate details into array above
        @exercise_names << exercise.name unless @exercise_names.include? exercise.name
        @exercise_details << exercise
      end
    end
    # @exercise_details.sort! { |a,b| a.name.downcase <=> b.name.downcase }
    # @exercises.group_by(&:name)
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :complete, :category_id, :group_id, :schedule_date, exercises_attributes: [:id,:name, :weight, :repetitions, :repetition_duration_seconds, :rest_duration_seconds, :complete, :workout_id, :youtube_url, :_destroy])
  end

  def find_workout
    @workout = Workout.find(params[:id])
  end
end
