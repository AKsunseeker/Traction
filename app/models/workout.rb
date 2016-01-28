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
  belongs_to :category
  has_many :exercises 
  has_many :locations, as: :addressable



  def exercise_by_name(exercises)
    if exercises.length == 0
      return @unique_exercises
    else  
      @date = exercises.first.updated_at
      @sum = 0
      @name = exercises.first.name
      
      exercises.each do |ex|
        if ex.name == @name
          @sum += ex.weight * ex.repetitions
        end
      end
      @unique_exercises.push({
        name: @name,
        sum: @sum,
        date: @date
        })

      exercises.delete_if {|ex| ex.name == @name}
      exercise_by_name(exercises)
    end
  end

  def like_exercises(exercises)
    current_exercises = []
    exercises.map do |ex|
      current_exercises << ex
    end
    @unique_exercises = []
    exercise_by_name(current_exercises)
    binding.pry
    @unique_exercises
  end


end


