class ChangeDefaultToBiometrics < ActiveRecord::Migration
  def change
    change_column_default(:biometrics, :date, nil)
  end
end
