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

class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :locations, as: :addressable
  
  
end
