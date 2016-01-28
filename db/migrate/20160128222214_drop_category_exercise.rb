class DropCategoryExercise < ActiveRecord::Migration
  def change
    drop_table :category_exercises
  end
end
