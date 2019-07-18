# frozen_string_literal: true

require "rails_helper"

RSpec.describe DashboardsController do
  describe "GET /dashboard" do
    subject { get(dashboard_path) }

    context "given an authenticated user" do
      let!(:user) { create(:user) }
      before { sign_in(user) }

      it "returns the dashboard page" do
        subject
        expect(response).to have_http_status(:success)
      end
    end

    context "given no user" do
      it "redirects to the root path" do
        subject
        expect(response).to have_http_status(:redirect)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end
  end
end
