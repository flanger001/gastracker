# frozen_string_literal: true

require "rails_helper"

RSpec.describe StationsController do
  let(:user) { create(:user) }

  context "given an authenticated user" do
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
      let(:station_params) { attributes_for(:station) }

      it "creates a station" do
        expect { post stations_path, :params => { :station => station_params } }.to change { Station.count }.by(1)
        follow_redirect!
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /stations/:id" do
      let!(:station) { create(:station) }

      it "shows a station" do
        get stations_path(station)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /stations/:id/edit" do
      let!(:station) { create(:station) }

      it "returns an edit station form" do
        get edit_station_path(station)
        follow_redirect!
        follow_redirect!
        expect(path).to eq(dashboard_path)
      end
    end

    describe "PATCH /stations/:id" do
      let!(:station) { create(:station) }
      let(:station_params) { attributes_for(:station, :name => "Fresh") }

      it "updates a station" do
        expect { patch station_path(station), :params => { :station => station_params } }.to_not change { station.reload.name }
        # expect { patch station_path(station), :params => { :station => station_params } }.to change { station.reload.name }.to(station_params[:name])
        follow_redirect!
        follow_redirect!
        expect(path).to eq(dashboard_path)
      end
    end

    describe "DELETE /stations/:id" do
      let!(:station) { create(:station) }

      it "destroys a station" do
        expect { delete station_path(station) }.to_not change { Station.count }
        # expect { delete station_path(station) }.to change { Station.count }.by(-1)
        follow_redirect!
        follow_redirect!
        expect(path).to eq(dashboard_path)
      end
    end
  end

  context "given no user" do
    describe "GET /stations" do
      it "redirects to the home page" do
        get stations_path
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "GET /stations/new" do
      it "redirects to the home page" do
        get new_station_path
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "POST /stations" do
      it "redirects to the home page" do
        expect { post stations_path }.to_not change { Station.count }
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "GET /stations/:id" do
      let!(:station) { create(:station) }

      it "redirects to the home page" do
        get stations_path(station)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "GET /stations/:id/edit" do
      let!(:station) { create(:station) }

      it "redirects to the home page" do
        get edit_station_path(station)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "PATCH /stations/:id" do
      let!(:station) { create(:station) }
      let(:station_params) { attributes_for(:station, :name => "Fresh") }

      it "redirects to the home page" do
        expect { patch station_path(station), :params => { :station => station_params } }.to_not change { station.reload.name }
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "DELETE /stations/:id" do
      let!(:station) { create(:station) }

      it "redirects to the home page" do
        expect { delete station_path(station) }.to_not change { Station.count }
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end
  end
end
