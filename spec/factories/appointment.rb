# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    association :patient
    association :doctor
  end
end
