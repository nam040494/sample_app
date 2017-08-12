FactoryGirl.define do
  factory :user do
    name  { Faker::Name.name }
    email  { Faker::Internet.email }
    password  "password"
    password_digest "password"
  end
end
