class AddCategoryRefToWorkouts < ActiveRecord::Migration
  def change
    add_reference :workouts, :category, index: true, foreign_key: true
  end
end
