require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'attributes' do
    it 'has a lat' do 
      lat = 100.1
      location = Location.create(lat: lat)
      expect(location.lat).to eq(lat) 
    end

    it 'has a long' do 
      long = 100.1
      location = Location.create(long: long)
      expect(location.long).to eq(long) 
    end

    it 'has a street' do 
      street = 'Mulberry'
      location = Location.create(street: street)
      expect(location.street).to eq(street) 
    end

    it 'has a zip' do 
      zip = '84010'
      location = Location.create(zip: zip)
      expect(location.zip).to eq(zip) 
    end

    it 'has a state' do 
      state = 'Utah'
      location = Location.create(state: state)
      expect(location.state).to eq(state) 
    end

    it 'has a city' do 
      city = 'Salt Lake City'
      location = Location.create(city: city)
      expect(location.city).to eq(city) 
    end

    it 'has a user_id' do 
      user_id = 1
      location = Location.create(user_id: user_id)
      expect(location.user_id).to eq(user_id) 
    end

    it 'has a group_id' do 
      group_id = 1
      location = Location.create(group_id: group_id)
      expect(location.group_id).to eq(group_id) 
    end

    it 'has a workout_id' do 
      workout_id = 1
      location = Location.create(workout_id: workout_id)
      expect(location.workout_id).to eq(workout_id) 
    end

    it 'has a exercise_id' do 
      exercise_id = 1
      location = Location.create(exercise_id: exercise_id)
      expect(location.exercise_id).to eq(exercise_id) 
    end
  end
end