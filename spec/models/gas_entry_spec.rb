require "rails_helper"

RSpec.describe GasEntry do
  fixtures :users, :vehicles, :stations

  test "calculates price per gallon only if cost present" do
    user = users(:one)
    gas_entry_data = {
      :odometer => 123456,
      :gallons => 13.259,
      :distance => 420,
      :date => DateTime.now,
      :cost => 35.19
    }
    gas_entry = user.gas_entries.build(gas_entry_data)
    assert_nil gas_entry.price_per_gallon

    gas_entry.save
    assert gas_entry.price_per_gallon > 0
  end

  test "calculates cost only if price per gallon present" do
    user = users(:one)
    gas_entry_data = {
      :odometer => 123456,
      :gallons => 13.259,
      :distance => 420,
      :date => DateTime.now,
      :price_per_gallon => 2.229
    }
    gas_entry = user.gas_entries.build(gas_entry_data)
    assert_nil gas_entry.cost

    gas_entry.save
    assert gas_entry.cost > 0
  end
end
