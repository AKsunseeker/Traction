require 'rails_helper'

RSpec.describe Workout, type: :model do
  describe 'attributes' do
    it 'has an id' do 
      id = 100
      workout = Workout.create(id: id)
      expect(workout.id).to eq(id) 
    end

    it 'has a creator_id' do 
      creator_id = 1
      workout = Workout.create(creator_id: creator_id)
      expect(workout.creator_id).to eq(creator_id) 
    end

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
  end

  describe 'validations' do
    it { should belong_to(:user)}
    it { should belong_to(:category)}
    it { should have_many(:exercises) }
    it { should accept_nested_attributes_for(:exercises).allow_destroy(true)}
    # How to test the reject_if ??? for accept_nested_attributes_for
    it { should have_many(:locations)}
    it { should validate_presence_of(:name)}
  end
end