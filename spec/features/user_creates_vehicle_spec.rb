require "rails_helper"

RSpec.describe "UserCreatesVehicle" do
  let(:user) { create(:user) }

  it "creates a vehicle for the user" do
    sign_in(user)

    visit(new_vehicle_path)

    within("form") do
    end
  end
end
