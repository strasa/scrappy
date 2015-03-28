FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :project do
    sequence(:name) { |n| "Test Project #{n}" }
    description "Description made JUST FOR TESTING!"
    user
  end
end
