require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'attributes' do
    # it 'has a workout_id' do
    #   workout_id = 2
    #   category = Category.create(workout_id: workout_id)
    #   expect(category.workout_id).to eq(workout_id)
    # end

    # it 'has a exercise_id' do
    #   exercise_id = 2
    #   category = Category.create(exercise_id: exercise_id)
    #   expect(category.exercise_id).to eq(exercise_id)
    # end

    # it 'has a group_id' do
    #   group_id = 2
    #   category = Category.create(group_id: group_id)
    #   expect(category.group_id).to eq(group_id)
    # end

    it 'has a description' do
      description = 'loves to dance'
      category = Category.create(description: description)
      expect(category.description).to eq(description)
    end

    it 'has a name' do
      name = 'Ricardo'
      category = Category.create(name: name)
      expect(category.name).to eq(name)
    end
  end
end