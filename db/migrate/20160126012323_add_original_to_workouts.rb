class AddOriginalToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :original, :boolean
  end
end
