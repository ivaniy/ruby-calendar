FactoryBot.define do
  factory :event do
    name Faker::GameOfThrones.character
    description Faker::Lorem.sentence
    location Faker::Address.street_address
    date Faker::Date.forward(10)
    start_at Faker::Time.forward(10, :morning)
    end_at Faker::Time.forward(10, :evening)
    user
  end
end
