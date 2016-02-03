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

    it 'has an original status' do 
      original = true
      workout = Workout.create(original: original)
      expect(workout.original).to eq(original) 
    end

    it 'has a category_id' do 
      category_id = 1
      workout = Workout.create(category_id: category_id)
      expect(workout.category_id).to eq(category_id) 
    end

    it 'has a created_by_user integer' do 
      created_by_user = 1
      workout = Workout.create(created_by_user: created_by_user)
      expect(workout.created_by_user).to eq(created_by_user) 
    end
  end

  describe 'validations' do
    it { should belong_to(:user)}
    it { should belong_to(:category)}
    it { should have_many(:exercises) }
    it { should accept_nested_attributes_for(:exercises).allow_destroy(true)}
    # How to test the reject_if: :all_blank ??? for accept_nested_attributes_for
    it { should have_many(:locations)}
    it { should validate_presence_of(:name)}
  end

  describe 'instance methods' do
    it 'return like exercises' do
      workout = Workout.create(name: "Workout 1")
      exercise1 = workout.exercises.create(name: 'deadlift', weight: 12.5, repetitions: 12, repetition_duration_seconds: 120, complete: true)
      exercise2 = workout.exercises.create(name: 'deadlift', weight: 12.5, repetitions: 12, repetition_duration_seconds: 120, complete: true)
      exercise3 = workout.exercises.create(name: 'deadlift', weight: 12.5, repetitions: 12, repetition_duration_seconds: 120, complete: true)
      sum = (exercise1.weight * exercise1.repetitions) + (exercise2.weight * exercise2.repetitions) + (exercise3.weight * exercise3.repetitions)
      exercises = workout.like_exercises([exercise1, exercise2, exercise3])
      expect(exercises).to eq([{name: exercise1.name, sum: sum}])
    end
  end
end