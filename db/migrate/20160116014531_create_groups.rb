class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :status
      t.date :founding_date
      

      t.timestamps null: false
    end
  end
end
