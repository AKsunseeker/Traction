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
    redirect_to user_biometrics_path(@user, @biometric)
  end

  def get_biometrics_progress
    @biometrics = current_user.biometrics.all.order(updated_at: :desc)
    if @biometrics.any?
      line_chart_json = {date_labels: [], data: {weight: [], body_fat_percentage: []}, logs: []}
      @biometrics.each do |biometric|
        line_chart_json[:date_labels] << biometric.date
        line_chart_json[:data][:weight] << biometric.weight
        line_chart_json[:data][:body_fat_percentage] << biometric.body_fat_percentage
      end
        render json: line_chart_json
    else
      render json: ["No Biometrics"]
    end
  end

  private
    def biometric_params
      params.require(:biometric).permit(:weight, :body_fat_percentage, :chest, 
                                        :height, :waist, :shoulder, :hips, :biceps, :ape_index, 
                                        :thigh, :calf, :forearm, :wrist, :neck, :date, :exercise_id)
    end

    def find_user
      @user = current_user
    end

    def find_biometric
      @biometric = @user.biometrics.find(params[:id])
    end

    def find_date
      @date = Date.today
    end
end
