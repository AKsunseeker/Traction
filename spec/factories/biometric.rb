FactoryGirl.define do
  factory :biometric, class: Biometric do
    date Date.today
    weight 123
    body_fat_percentage 12
    user
  end
end