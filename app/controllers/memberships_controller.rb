# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  join_date  :date
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MembershipsController < ApplicationController
end
