FactoryBot.define do
  factory :user do
    name Faker::Name.first_name
    surname Faker::Name.last_name
    email Faker::Internet.email
    password '111111'
    password_confirmation '111111'
    confirmed_at Time.zone.now
  end
end
