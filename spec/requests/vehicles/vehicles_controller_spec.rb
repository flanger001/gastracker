# frozen_string_literal: true

require "rails_helper"

RSpec.describe Vehicles::VehiclesController do
  let(:user) { create(:user) }

  context "given an authenticated user" do
    before { sign_in(user) }

    describe "GET /vehicles" do
      it "returns a list of vehicles" do
        get vehicles_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /vehicles/new" do
      it "returns a new vehicle form" do
        get new_vehicle_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST /vehicles" do
      let(:vehicle_params) { attributes_for(:vehicle) }

      it "creates a new vehicle" do
        expect { post vehicles_path, :params => { :vehicle => vehicle_params } }.to change { Vehicle.count }.by(1)

        follow_redirect!

        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /vehicles/:id" do
      let!(:vehicle) { create(:vehicle, :user_id => user.id) }

      it "returns a vehicle" do
        get vehicle_path(vehicle)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /vehicles/:id/edit" do
      let!(:vehicle) { create(:vehicle, :user_id => user.id) }

      it "returns an edit vehidle form" do
        get edit_vehicle_path(vehicle)
        expect(response).to have_http_status(:success)
      end
    end

    describe "PATCH /vehicles/:id" do
      let!(:vehicle) { create(:vehicle, :user_id => user.id) }
      let(:vehicle_params) { attributes_for(:vehicle, :year => 2001) }

      it "updates a vehicle" do
        expect { patch vehicle_path(vehicle), :params => { :vehicle => vehicle_params } }.to change { vehicle.reload.year }.to("2001")

        follow_redirect!

        expect(response).to have_http_status(:success)
      end
    end

    describe "DELETE /vehicles/:id" do
      let!(:vehicle) { create(:vehicle, :user_id => user.id) }
      it "destroys a vehicle" do
        expect { delete vehicle_path(vehicle) }.to change { Vehicle.count }.by(-1)

        follow_redirect!

        expect(response).to have_http_status(:success)
      end
    end
  end

  context "given no user" do
    describe "GET /vehicles" do
      it "redirects to the root path" do
        get vehicles_path
        expect(response).to have_http_status(:redirect)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "GET /vehicles/new" do
      it "redirects to the root path" do
        get new_vehicle_path
        expect(response).to have_http_status(:redirect)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "POST /vehicles" do
      let(:vehicle_params) { attributes_for(:vehicle) }

      it "redirects to the root path" do
        expect { post vehicles_path, :params => { :vehicle => vehicle_params } }.to_not change { Vehicle.count }

        follow_redirect!

        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /vehicles/:id" do
      let!(:vehicle) { create(:vehicle, :user_id => user.id) }

      it "redirects to the root path" do
        get vehicle_path(vehicle)
        expect(response).to have_http_status(:redirect)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "GET /vehicles/:id/edit" do
      let!(:vehicle) { create(:vehicle, :user_id => user.id) }

      it "redirects to the root path" do
        get edit_vehicle_path(vehicle)
        expect(response).to have_http_status(:redirect)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "PATCH /vehicles/:id" do
      let!(:vehicle) { create(:vehicle, :user_id => user.id) }
      let(:vehicle_params) { attributes_for(:vehicle, :year => 2001) }

      it "redirects to the root path" do
        expect { patch vehicle_path(vehicle), :params => { :vehicle => vehicle_params } }.to_not change { vehicle.reload.year }

        follow_redirect!

        expect(path).to eq(root_path)
      end
    end

    describe "DELETE /vehicles/:id" do
      let!(:vehicle) { create(:vehicle, :user_id => user.id) }
      it "redirects to the root path" do
        expect { delete vehicle_path(vehicle) }.to_not change { Vehicle.count }

        follow_redirect!

        expect(response).to have_http_status(:success)
        expect(path).to eq(root_path)
      end
    end
  end
end
