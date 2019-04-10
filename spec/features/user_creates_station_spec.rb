require "rails_helper"

RSpec.describe "UserCreatesStation" do
  let(:user) { create(:user) }

  it "creates a station for the user" do
    sign_in(user)

    visit(new_station_path)

    within("form") do
      fill_in("Name", :with => "Exxon")
      fill_in("Address", :with => "123 Main St")
      fill_in("City", :with => "Anywhere")
      fill_in("State", :with => "NY")
      fill_in("Zip", :with => "10001")
    end

    click_button("Create Station")

    expect(page).to have_text("Station was successfully created")
  end
end
