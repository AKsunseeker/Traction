require 'rails_helper'

RSpec.describe Exercise, type: :model do
  describe 'attributes' do
    it 'has an id' do 
      id = 100
      exercise = Exercise.create(id: id)
      expect(exercise.id).to eq(id) 
    end

    it 'has a name' do 
      name = 'deadlift'
      exercise = Exercise.create(name: name)
      expect(exercise.name).to eq(name) 
    end
    
    it 'has a weight' do
      weight = 12.5
      exercise = Exercise.create(weight: weight)
      expect(exercise.weight).to eq(weight)
    end

    it 'has repetitions' do
      repetitions = 12
      exercise = Exercise.create(repetitions: repetitions)
      expect(exercise.repetitions).to eq(repetitions)
    end

    it 'has a repetition_duration_seconds' do
      repetition_duration_seconds = 1234
      exercise = Exercise.create(repetition_duration_seconds: repetition_duration_seconds)
      expect(exercise.repetition_duration_seconds).to eq(repetition_duration_seconds)
    end

    it 'has a rest_duration_seconds' do 
      rest_duration_seconds = 3000
      exercise = Exercise.create(rest_duration_seconds: rest_duration_seconds)
      expect(exercise.rest_duration_seconds).to eq(rest_duration_seconds) 
    end

    it 'has a complete' do
      complete = true
      exercise = Exercise.create(complete: complete)
      expect(exercise.complete).to eq(complete)
    end

    it 'has a workout_id' do
      workout_id = 12
      exercise = Exercise.create(workout_id: workout_id)
      expect(exercise.workout_id).to eq(workout_id)
    end
  end
end