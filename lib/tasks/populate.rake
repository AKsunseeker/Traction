namespace :populate do
  require 'populator'
  require 'faker'

  desc "Create workouts and exercises for chart purposes"
  task data: :environment do
    Workout.populate 50 do |workout|
      workout.name = Faker::Hacker.ingverb
      workout.original = true
      workout.creator_id = workout.id
      Exercise.populate 10 do |exercise|
        exercise.name = Faker::Hacker.verb
        exercise.weight = [2.5, 5.5, 4.5].sample
        exercise.repetitions = Faker::Number.between(1,15)
        exercise.repetition_duration_seconds = Faker::Number.between(1,15)
        exercise.rest_duration_seconds = Faker::Number.between(1,15)
        exercise.complete = [true, false].sample
        exercise.workout_id = workout.id
      end
    end

  end

  desc "Create categories"
  task categories: :environment do
    categories = ['Misc', 'Strength', 'Power', 'Strength-Endurance', 'Endurance', 'Recovery']
    categories.each do |category|
      Category.create(name: category) 
    end
  end
end