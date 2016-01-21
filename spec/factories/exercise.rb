FactoryGirl.define do
  factory :exercise, class: Exercise do
    name 'deadlift'
    weight 12.5
    repetitions 12
    repetition_duration_seconds 120
    complete false
    workout
  end
end