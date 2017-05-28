FactoryGirl.define do
  factory :user do
    email    { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end

FactoryGirl.define do
  factory :profile do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    bio         { Faker::Lorem.sentence }
  end
end
