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

class Biometric < ActiveRecord::Base
  belongs_to :user
end
