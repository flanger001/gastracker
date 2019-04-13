require "rails_helper"

RSpec.describe "User resets password" do

  context "given an existing user" do
    let!(:user) { create(:user) }

    it "allows the user to reset their password" do
      visit(new_password_request_path)

      expect(page).to have_text("If you have an account, enter your email here and we will send you a password reset link shortly!")

      within("form") do
        fill_in("Email", :with => user.email)
      end

      click_button("Request new password")

      visit(new_password_reset_path(:token => user.password_request.token))

      expect(page).to have_text("Please enter your new password now. You will be logged out and can log back in with your new password.")

      within("form") do
        fill_in "password_reset[new_password]", :with => "friendship"
        fill_in "password_reset[new_password_confirmation]", :with => "friendship"
      end

      click_button("Reset password")

      visit(login_path)

      within("form") do
        fill_in "session[email]", :with => user.email
        fill_in "session[password]", :with => "friendship"
      end

      click_button("Log In")

      expect(page.current_path).to eq(dashboard_path)
    end
  end

  context "given a non-existent user" do
    it "does not fail to fill out the form but does not generate a token" do
      visit(new_password_request_path)

      within("form") do
        fill_in("Email", :with => "user@example.com")
      end

      click_button("Request new password")

      expect(page).to have_text("Please check your email for a password reset token.")
    end
  end
end
