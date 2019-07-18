# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "John Doe" }
    sequence(:email) { |i| "foo#{i}@example.com" }
    password_digest { BCrypt::Password.create("p@ssw0rd", :cost => 4) }
  end
end
