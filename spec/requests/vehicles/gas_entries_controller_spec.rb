require "rails_helper"

RSpec.describe Vehicles::GasEntriesController do
  let(:user) { create(:user) }
  let!(:vehicle) { create(:vehicle, :user_id => user.id) }

  describe "GET /vehicles/:vehicle_id/gas_entries" do
    before { sign_in(user) }

    it "gets a list of gas entries" do
      get vehicle_gas_entries_path(vehicle)
      expect(response).to have_http_status(:success)
    end
  end
end
