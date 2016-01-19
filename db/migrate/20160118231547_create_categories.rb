class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.belongs_to :group
      t.belongs_to :workout

      t.timestamps null: false
    end
  end
end
