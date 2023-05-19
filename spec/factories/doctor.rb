# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    phone { Faker::Number.number(digits: 12).to_s }
    password { Faker::Internet.password }
    category { create(:category) }
  end
end
