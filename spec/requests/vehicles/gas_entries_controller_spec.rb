require "rails_helper"

RSpec.fdescribe Vehicles::GasEntriesController do
  let(:user) { create(:user) }
  let!(:vehicle) { create(:vehicle, :user_id => user.id) }

  def sign_in(user)
    post "/session", :params => { :email => user.email, :password => "p@ssw0rd" }
  end

  before do
    sign_in(user)
  end

  it "gets a list of gas entries" do
    get "/vehicles/#{vehicle.id}/gas_entries"
    expect(response).to have_http_status(:success)
  end
end
