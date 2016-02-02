class AddDefaultsToExercises < ActiveRecord::Migration
  def change
    change_column :exercises, :weight, :float, default: 1.0
    change_column :exercises, :repetitions, :integer, default: 1
  end
end
