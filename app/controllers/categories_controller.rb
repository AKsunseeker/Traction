# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  group_id    :integer
#  workout_id  :integer
#  exercise_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategoriesController < ApplicationController
  before_action :find_workout, except: [:get_categories_progress]
  before_action :find_exercise, only: [:new]
  before_action :find_category, except: [:index, :new, :create, :get_categories_progress]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      @exercise << @category
      redirect_to workout_exercise_path(@workout, @exercise)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update
      redirect_to workout_exercise_path(@workout, @exercise)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to workout_exercise_path(@workout, @exercise)
  end

  def get_categories_progress
    @categories = Category.all
    @category_json_data = []
    @categories.map {|category| @category_json_data << {"#{category.name}" => 0} }
    current_user.workouts.where(complete: true).each do |workout|
      if workout.category
        (0...@category_json_data.length).each do |i|
          if @category_json_data[i].keys[0] == workout.category.name 
            @category_json_data[i][workout.category.name] += 1
          end
        end
      end
    end
    render json: @category_json_data
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def find_workout
    @workout = Workout.find_by(params[:workout_id])
  end

  def find_exercise
    @exercise = @workout.exercises.find_by(params[:exercise_id])
  end
end
