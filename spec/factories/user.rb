FactoryGirl.define do
  factory :user, class: User do
    first_name 'Harriet'
    last_name 'Tubman'
    handle 'htubby'
    sequence(:email){|n| "user#{n}@factory.com" }
    password{ "secret12" }
  end
end