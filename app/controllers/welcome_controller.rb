class WelcomeController < ApplicationController
  access all: [:index, :about_us], trainer: :all
  def index
    if current_user && current_user.workouts.any?
      @workouts = current_user.workouts.page(params[:page])
      @list_workouts =  @workouts.where(complete: true)
      names = @list_workouts.map {|workout| workout.name}
      uniq_list = names.uniq
      @unique_workout_names = []
      uniq_list.each do |name|
        @unique_workout_names << @list_workouts.where(name: name).first
      end
      render :show
    else
      @list_workouts = []
      @unique_workout_names = []
    end
  end

  def show
    @user_id = current_user.id
    @workouts = current_user.workouts
  end

  def about_us
  end

end
