class WelcomeController < ApplicationController
  access all: [:index, :about_us], trainer: :all
  def index
    if current_user
      @workouts = current_user.workouts
      list_workouts =  @workouts.where(complete: true).map {|workout| workout.name}
      @unique_workout_names = []
      list_workouts.each do |name|
        @unique_workout_names << @workouts.where(name: name).first
      end
      render :show
    end
  end

  def show
    @user_id = current_user.id
    @workouts = current_user.workouts
  end

  def about_us
  end

end
