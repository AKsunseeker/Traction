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

class Exercise < ActiveRecord::Base
  belongs_to :workout
  has_many :locations, as: :addressable
  has_many :category_exercises
  has_many :categories, through: :category_exercises
end
