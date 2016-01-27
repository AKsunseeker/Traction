require 'rails_helper'

RSpec.describe Workout, type: :model do
  describe 'attributes' do
    it 'has a name' do 
      name = 'workout name'
      workout = Workout.create(name: name)
      expect(workout.name).to eq(name) 
    end

    it 'has a complete status' do 
      complete = true
      workout = Workout.create(complete: complete)
      expect(workout.complete).to eq(complete) 
    end

    it 'has a user_id' do 
      user_id = 1
      workout = Workout.create(user_id: user_id)
      expect(workout.user_id).to eq(user_id) 
    end

    it 'has a group_id' do 
      group_id = 1
      workout = Workout.create(group_id: group_id)
      expect(workout.group_id).to eq(group_id) 
    end
  end
end