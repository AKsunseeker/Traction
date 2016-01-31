class RemoveColumnsFromBiometrics < ActiveRecord::Migration
  def change
    remove_column :biometrics, :date_of_birth
    remove_column :biometrics, :gender
  end
end
