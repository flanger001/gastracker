module FeatureMethods
  include Capybara::DSL

  def sign_in(user)
    visit login_path

    within("form") do
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: "p@ssw0rd"
    end

    click_button "Log In"
  end
end
