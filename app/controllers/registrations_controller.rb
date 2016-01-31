class RegistrationsController < Devise::RegistrationsController
  private
  def after_update_path_for(current_user)
      user_path(current_user)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :handle, :email, :password, :password_confirmation, :current_password, :gender, :date_of_birth)
  end
end
