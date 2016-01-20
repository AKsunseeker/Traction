class CategoryExercise < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :category
end
