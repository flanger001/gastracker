# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "capybara/rspec"
require "support/request_methods"
require "support/feature_methods"

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include(FactoryBot::Syntax::Methods)
  config.include(ActiveSupport::Testing::TimeHelpers)
  config.include(RequestMethods, :type => :request)
  config.include(FeatureMethods, :type => :system)

  config.before(:each, :type => :system) do
    driven_by :selenium, :using => :headless_firefox
  end
end
