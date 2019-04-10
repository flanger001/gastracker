require "rails_helper"

RSpec.describe "UserCreatesEntry" do
  test "user creates entry" do
    visit gas_entries_path
    assert_equal page.status_code, 200
  end
end
