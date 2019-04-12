require "rails_helper"

RSpec.describe "UserCreatesAccount" do
  it "creates an account for the user and redirects to the dashboard" do
    visit(root_path)
    expect(page).to have_content("Gas Tracker")
    expect(page).to have_link("Sign Up")
    expect(page).to have_link("Log In")

    visit(new_user_path)
    expect(page).to have_content("Sign Up")

    within("form") do
      fill_in("Name", :with => "Jane Doe")
      fill_in("Email", :with => "bar@example.com")
      fill_in("Password", :with => "p@ssw0rd")
      fill_in("Password confirmation", :with => "p@ssw0rd")
    end

    click_button("Sign Up")

    expect(page.current_url).to eq(dashboard_url)
  end
end
