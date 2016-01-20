class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.date :join_date
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps null: false
    end
  end
end
