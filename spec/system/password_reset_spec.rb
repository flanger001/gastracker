# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Password Reset Flow" do
  it "creates a bunch of records" do
    visit root_path

    expect(page).to have_text("Gas Tracker")
  end
end
