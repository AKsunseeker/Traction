# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  lat         :float
#  long        :float
#  street      :string
#  city        :string
#  state       :string
#  zip         :string
#  user_id     :integer
#  group_id    :integer
#  workout_id  :integer
#  exercise_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LocationsController < ApplicationController
end
