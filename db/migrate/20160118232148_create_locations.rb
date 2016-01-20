class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :lat
      t.float :long
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.references :addressable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
