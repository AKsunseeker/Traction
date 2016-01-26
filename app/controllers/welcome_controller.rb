class WelcomeController < ApplicationController
  access all: [:index], trainer: :all
  def index
    if current_user
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
