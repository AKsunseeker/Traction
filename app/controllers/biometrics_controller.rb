# == Schema Information
#
# Table name: biometrics
#
#  id                  :integer          not null, primary key
#  date_of_birth       :date
#  weight              :float
#  gender              :string
#  body_fat_percentage :float
#  chest               :float
#  height              :float
#  waist               :float
#  shoulder            :float
#  hips                :float
#  biceps              :float
#  ape_index           :float
#  thigh               :float
#  calf                :float
#  forearm             :float
#  wrist               :float
#  neck                :float
#  date                :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#

class BiometricsController < ApplicationController
  before_action :find_user
  before_action :find_biometric, only: [:show, :edit, :destroy, :update]
  before_action :find_date, only: [:create, :update]
  
  def index
    @biometrics = @user.biometrics.all
  end

  def show
  end

  def new
    @biometric = @user.biometrics.new
  end

  def create
    @biometric = @user.biometrics.new(biometric_params)
    if @biometric.save
      redirect_to user_biometrics_path(@user, @biometric)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @biometric.update(biometric_params)
      redirect_to user_biometrics_path(@user, @biometric)
    else
      render :edit
    end
  end

  def destroy
    @biometric.destroy
    redirect_to user_path(@user)
  end

  private
    def biometric_params
      params.require(:biometric).permit(:dateof_birth, :weight, :gender, :body_fat_percentage, :chest, 
                                        :height, :waist, :shoulder, :hips, :biceps, :ape_index, 
                                        :thigh, :calf, :forearm, :wrist, :neck, :date, :exercise_id)
    end

    def find_user
      @user = User.find(params[:user_id])
    end

    def find_biometric
      @biometric = @user.biometrics.find(params[:id])
    end

    def find_date
      @date = Date.today
    end
end
