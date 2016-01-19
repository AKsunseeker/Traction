class CreateBiometrics < ActiveRecord::Migration
  def change
    create_table :biometrics do |t|
      t.date     :date_of_birth
      t.float    :weight
      t.string   :gender
      t.float    :body_fat_percentage
      t.float    :chest
      t.float    :height
      t.float    :waist
      t.float    :shoulder
      t.float    :hips
      t.float    :biceps
      t.float    :ape_index
      t.float    :thigh
      t.float    :calf
      t.float    :forearm
      t.float    :wrist
      t.float    :neck
      t.date     :date
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
