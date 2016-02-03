FactoryGirl.define do 
  factory :workout, class: Workout do
    name 'Day 1'
    complete false
    creator_id 1
    user
    category
  end
end