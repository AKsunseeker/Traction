class AddDefaultsToExercises < ActiveRecord::Migration
  def change
    change_column :exercises, :weight, :float, default: 0.0
    change_column :exercises, :repetitions, :integer, default: 0
  end
end
