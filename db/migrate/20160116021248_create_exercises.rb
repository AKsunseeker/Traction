class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.float :weight
      t.integer :repetitions
      t.integer :repetition_duration_seconds
      t.integer :rest_duration_seconds
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
