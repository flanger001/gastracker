FactoryBot.define do
  factory :station do
    sequence(:name) { |i| "Station #{i}" }
  end
end
