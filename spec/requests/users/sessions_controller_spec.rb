require "rails_helper"

RSpec.describe Users::SessionsController do
  let!(:user) { create(:user) }

  context "given no user" do
    describe "GET session/new" do
      it "returns a login form" do
        get new_session_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST /session" do
      let(:user_params) { { :email => user.email, :password => "p@ssw0rd" } }

      it "logs the user in and redirects to the dashboard" do
        post session_path, :params => { :session => user_params }
        follow_redirect!
        expect(path).to eq(dashboard_path)
      end
    end

    describe "DELETE /session" do
      it "redirects to the home page" do
        delete session_path
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end
  end

  context "given an authenticated user" do
    before { sign_in(user) }

    describe "GET session/new" do
      it "redirects to the dashboard" do
        get new_session_path
        follow_redirect!
        follow_redirect!
        expect(path).to eq(dashboard_path)
      end
    end

    describe "POST /session" do
      let(:user_params) { { :email => user.email, :password => "p@ssw0rd" } }

      it "redirects to the dashboard" do
        post session_path, :params => { :session => user_params }
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "DELETE /session" do
      it "logs the user out and redirects to the home page" do
        delete session_path
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end
  end
end
