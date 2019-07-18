# frozen_string_literal: true

require "rails_helper"

RSpec.describe "UserCreatesEntry" do
  let(:user) { create(:user) }
  let(:vehicle) { create(:vehicle, :user_id => user.id, :year => "2000", :brand => "Honda", :name => "Accord") }

  it "user creates entry" do
    sign_in(user)

    visit(vehicle_gas_entries_path(vehicle))

    expect(page.status_code).to eq(200)
    expect(page).to have_text("All Gas Entries for 2000 Honda Accord")

    # TODO: Create entry
  end
end
