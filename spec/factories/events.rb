FactoryBot.define do
  factory :event do
    name { "MyString" }
    description { "MyString" }
    location { "MyString" }
    date { "2018-09-13" }
    start_time { "2018-09-13 14:04:53" }
    end_time { "2018-09-13 14:04:53" }
    users { nil }
  end
end
