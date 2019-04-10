require "rails_helper"

RSpec.describe StationsController do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe "GET /stations" do
    it "returns a list of stations" do
      get stations_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /stations/new" do
    it "returns a new station form" do
      get new_station_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /stations" do
    let(:station_params) { attributes_for(:station, :user_id => user.id) }

    it "creates a station" do
      expect { post stations_path, params: { :station => station_params } }.to change { Station.count }.by(1)
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /stations/:id" do
    let!(:station) { create(:station, :user_id => user.id) }

    it "shows a station" do
      get stations_path(station)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /stations/:id/edit" do
    let!(:station) { create(:station, :user_id => user.id) }

    it "returns an edit station" do
      get edit_station_path(station)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /stations/:id" do
    let!(:station) { create(:station, :user_id => user.id) }
    let(:station_params) { attributes_for(:station, :user_id => user.id, :name => "Fresh") }

    it "updates a station" do
      expect { patch station_path(station), :params => { :station => station_params } }.to change { station.reload.name }.to(station_params[:name])
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /stations/:id" do
    let!(:station) { create(:station, :user_id => user.id) }

    it "destroys a station" do
      expect { delete station_path(station) }.to change { Station.count }.by(-1)
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end
end
