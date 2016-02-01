class AddCreatedByUserColumntoWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :created_by_user, :integer
  end
end
