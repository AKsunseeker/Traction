class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :exercises 
end
