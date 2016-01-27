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

class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises 
  has_many :locations, as: :addressable



  def like_exercises(workout_id)
    exercises = Workout.find(workout_id).exercises
    binding.pry

    
    # find all of the exercises with the same name
    # sum the weight * reps
    # return the name and sum and updated at
  end


end


