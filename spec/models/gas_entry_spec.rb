require "rails_helper"

RSpec.describe GasEntry do
  describe "#calculate_cost_or_ppg" do
    let(:gas_entry_params) do
      {
        :odometer => 123456,
        :gallons => 13.259,
        :distance => 420,
        :date => DateTime.now
      }
    end

    subject { gas_entry.calculate_cost_or_ppg }

    context "if cost present" do
      let(:gas_entry) { build(:gas_entry, **gas_entry_params, :cost => 35.19) }

      it "calculates price per gallon" do
        subject
        expect(gas_entry.price_per_gallon.round(3)).to eq(2.654)
      end
    end

    context "if price per gallon present" do
      let(:gas_entry) { build(:gas_entry, **gas_entry_params, :price_per_gallon => 2.229) }

      it "calculates cost" do
        subject
        expect(gas_entry.cost.round(3)).to eq(29.554)
      end
    end
  end
end
