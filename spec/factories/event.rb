FactoryBot.define do
  factory :valid_event, class: Event do
    name Faker::Lorem.characters(10)
    description Faker::Lorem.sentence
    location Faker::Address.street_address
    date Faker::Date.forward(10)
    start_event Faker::Time.forward(10, :morning)
    end_event Faker::Time.forward(10, :evening)
    user
  end

  factory :invalid_event, class: Event do
    name Faker::Lorem.characters(100)
    description Faker::Lorem.sentence
    location Faker::Address.street_address
    date Faker::Date.forward(10)
    start_event Faker::Time.forward(10, :evening)
    end_event Faker::Time.forward(10, :morning)
    user
  end
end
