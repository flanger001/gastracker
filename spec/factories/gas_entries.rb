# frozen_string_literal: true

FactoryBot.define do
  factory :gas_entry do
    odometer { 1 }
    gallons { 1.5 }
    distance { 1.5 }
    date { Time.zone.today }
  end
end
