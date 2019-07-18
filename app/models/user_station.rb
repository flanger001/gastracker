# frozen_string_literal: true

class UserStation < ApplicationRecord
  belongs_to :user
  belongs_to :station
end
