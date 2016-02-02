class WelcomeController < ApplicationController
  access all: [:index, :about_us], trainer: :all
  def index
    added_workouts ||= []
    if current_user 
      if current_user.workouts.any?
        @workouts = current_user.workouts
        @list_workouts =  @workouts.where(complete: true).page(params[:page])
        @added_workouts = current_user.workouts.where(complete: false).page(params[:page])
        names = @list_workouts.map {|workout| workout.name}
        uniq_list = names.uniq
        @unique_workout_names = []
        uniq_list.each do |name|
          @unique_workout_names << @list_workouts.where(name: name).first
        end
      else
        @list_workouts = []
        @unique_workout_names = []
        added_workouts ||= []
      end
      render :show
    end
  end

  def show
    @user_id = current_user.id
    @workouts = current_user.workouts
    @added_workouts ||= []
    binding.pry
  end

  def about_us
  end

end
