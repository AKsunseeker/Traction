class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :location
      t.string :status
      t.string :category
      t.date :founding_date

      t.timestamps null: false
    end
  end
end
