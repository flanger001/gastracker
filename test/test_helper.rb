ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/reporters"
require "capybara/rails"

Minitest::Reporters.use!
Capybara.javascript_driver = :webkit

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def sign_in(user)
    session[:user_id] = user.id
  end

end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def sign_in(user)
    session[:user_id] = user.id
  end
end
