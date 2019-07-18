# frozen_string_literal: true

require "rails_helper"

RSpec.describe PasswordRequestsController do
  context "given an existing user" do
    let!(:user) { create(:user) }

    describe "GET /password_request/new" do
      it "returns a new password request form" do
        get new_password_request_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST /password_request" do
      let(:password_request_params) { { :email => user.email } }

      before { ActionMailer::Base.deliveries = [] }

      it "creates a password request for the user and emails them a link" do
        expect { post(password_request_path, :params => { :password_request => password_request_params }) }.to change { PasswordRequest.count }.by(1)
        expect(ActionMailer::Base.deliveries).to_not be_empty
        follow_redirect!
        expect(response).to have_http_status(:success)
      end
    end
  end

  xcontext "given an authenticated user" do
    # TODO
  end

  xcontext "given non-existent user" do
    # TODO
  end
end
