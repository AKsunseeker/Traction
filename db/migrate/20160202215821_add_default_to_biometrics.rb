class AddDefaultToBiometrics < ActiveRecord::Migration
  def change
    change_column :biometrics, :date, :date, default: Date.today
  end
end
