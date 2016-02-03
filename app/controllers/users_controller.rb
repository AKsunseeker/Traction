# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  handle                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  roles                  :string
#

class UsersController < ApplicationController
  access all: [:index], trainer: :all, user: :all

  def show
    @user = User.find(params[:id])
    @biometrics = current_user.biometrics.all
  end

  private
    # def user_params
    #   params.require(:user).permit(:first_name, :last_name, :handle, :date_of_birth, :gender)
    # end

end
