# == Schema Information
#
# Table name: groups
#
#  id            :integer          not null, primary key
#  name          :string
#  status        :string
#  founding_date :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class GroupsController < ApplicationController
end
