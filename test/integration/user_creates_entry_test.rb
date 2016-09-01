require 'test_helper'

class UserCreatesEntryTest < ActionDispatch::IntegrationTest
  test 'user creates entry' do
    visit gas_entries_path
    assert_equal page.status_code, 200
  end
end
