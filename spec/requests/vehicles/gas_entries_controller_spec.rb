# frozen_string_literal: true

require "rails_helper"

RSpec.describe Vehicles::GasEntriesController do
  let(:user) { create(:user) }
  let!(:vehicle) { create(:vehicle, :user_id => user.id) }
  let!(:station) { create(:station) }
  let(:required_params) { { :vehicle_id => vehicle.id, :station_id => station.id } }

  context "given an authenticated user" do
    before { sign_in(user) }

    describe "GET /vehicles/:vehicle_id/gas_entries" do
      it "gets a list of gas entries" do
        get vehicle_gas_entries_path(vehicle)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /vehicles/:vehicle_id/gas_entries/new" do
      it "returns a new gas entry form" do
        get new_vehicle_gas_entry_path(vehicle)
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST /vehicles/:vehicle_id/gas_entries" do
      let(:gas_entry_params) { attributes_for(:gas_entry, **required_params) }
      it "creates a new gas entry for the given vehicle" do
        expect { post vehicle_gas_entries_path(vehicle), :params => { :gas_entry => gas_entry_params } }.to change { GasEntry.count }.by(1)
        follow_redirect!
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /vehicles/:vehicle_id/gas_entries/:id" do
      let!(:gas_entry) { create(:gas_entry, **required_params) }
      it "returns a gas entry" do
        get vehicle_gas_entry_path(vehicle, gas_entry)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /vehicles/:vehicle_id/gas_entries/:id/edit" do
      let!(:gas_entry) { create(:gas_entry, **required_params) }
      it "returns an edit gas entry form" do
        get edit_vehicle_gas_entry_path(vehicle, gas_entry)
        expect(response).to have_http_status(:success)
      end
    end

    describe "PATCH /vehicles/:vehicle_id/gas_entries/:id" do
      let!(:gas_entry) { create(:gas_entry, **required_params) }
      let(:gas_entry_params) { attributes_for(:gas_entry, **required_params, :date => Time.zone.tomorrow) }

      it "updates a gas entry" do
        freeze_time do
          expect { patch vehicle_gas_entry_path(vehicle, gas_entry), :params => { :gas_entry => gas_entry_params } }.to change { gas_entry.reload.date }.to(Time.zone.tomorrow)
          follow_redirect!
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe "DELETE /vehicles/:vehicle_id/gas_entries/:id" do
      let!(:gas_entry) { create(:gas_entry, **required_params) }
      it "deletes a gas entry" do
        expect { delete vehicle_gas_entry_path(vehicle, gas_entry) }.to change { GasEntry.count }.by(-1)
        follow_redirect!
        expect(response).to have_http_status(:success)
      end
    end
  end

  context "given no user" do
    describe "GET /vehicles/:vehicle_id/gas_entries" do
      it "redirects to the root page" do
        get vehicle_gas_entries_path(vehicle)
        expect(response).to have_http_status(:redirect)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "GET /vehicles/:vehicle_id/gas_entries/new" do
      it "redirects to the root page" do
        get new_vehicle_gas_entry_path(vehicle)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "POST /vehicles/:vehicle_id/gas_entries" do
      let(:gas_entry_params) { attributes_for(:gas_entry, **required_params) }
      it "redirects to the root page" do
        expect { post vehicle_gas_entries_path(vehicle), :params => { :gas_entry => gas_entry_params } }.to_not change { GasEntry.count }
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "GET /vehicles/:vehicle_id/gas_entries/:id" do
      let!(:gas_entry) { create(:gas_entry, **required_params) }
      it "redirects to the root page" do
        get vehicle_gas_entry_path(vehicle, gas_entry)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "GET /vehicles/:vehicle_id/gas_entries/:id/edit" do
      let!(:gas_entry) { create(:gas_entry, **required_params) }
      it "redirects to the root page" do
        get edit_vehicle_gas_entry_path(vehicle, gas_entry)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "PATCH /vehicles/:vehicle_id/gas_entries/:id" do
      let!(:gas_entry) { create(:gas_entry, **required_params) }
      let(:gas_entry_params) { attributes_for(:gas_entry, **required_params, :date => Time.zone.tomorrow) }

      it "redirects to the root page" do
        freeze_time do
          expect { patch vehicle_gas_entry_path(vehicle, gas_entry), :params => { :gas_entry => gas_entry_params } }.to_not change { gas_entry.reload.date }
          follow_redirect!
          expect(path).to eq(root_path)
        end
      end
    end

    describe "DELETE /vehicles/:vehicle_id/gas_entries/:id" do
      let!(:gas_entry) { create(:gas_entry, **required_params) }
      it "redirects to the root page" do
        expect { delete vehicle_gas_entry_path(vehicle, gas_entry) }.to_not change { GasEntry.count }
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end
  end
end
