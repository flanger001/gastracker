# frozen_string_literal: true

require "securerandom"

class PasswordRequest < ApplicationRecord
  belongs_to :user

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(64)
  end
end
