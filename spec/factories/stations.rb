# frozen_string_literal: true

FactoryBot.define do
  factory :station do
    sequence(:name) { |i| "Station #{i}" }
  end
end
