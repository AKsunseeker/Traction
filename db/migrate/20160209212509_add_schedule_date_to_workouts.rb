class AddScheduleDateToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :schedule_date, :date
  end
end
