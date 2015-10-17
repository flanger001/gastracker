require 'test_helper'

class UserCreatesAccountTest < ActionDispatch::IntegrationTest

  test "user creates account" do
    visit root_path
    assert page.has_content? 'Gas Tracker'
    assert page.has_link? 'Sign Up'
    assert page.has_link? 'Log In'

    visit signup_path
    assert has_content?('Sign Up')
    within('#new_user') do
      fill_in 'Name', with: 'Jane Doe'
      fill_in 'Email', with: 'bar@example.com'
      fill_in 'Password', with: 'p@ssw0rd'
      fill_in 'Password confirmation', with: 'p@ssw0rd'
    end
    click_button 'Sign Up'

    assert_equal page.current_url, dashboard_url
  end

end
