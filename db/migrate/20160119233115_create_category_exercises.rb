class CreateCategoryExercises < ActiveRecord::Migration
  def change
    create_table :category_exercises do |t|
      t.belongs_to :exercise, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
