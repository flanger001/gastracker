require "rails_helper"

RSpec.describe Users::PasswordsController do
  let!(:user) { create(:user) }

  context "given an authenticated user" do
    before { sign_in(user) }

    describe "GET /password/new" do
      it "returns a new password form" do
        get new_password_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST /password" do
      let(:password_params) { { :original_password => "p@ssw0rd", :new_password => "hunter2", :new_password_confirmation => "hunter2" } }

      it "updates the user's password and redirects to the account page" do
        expect { post password_path, :params => { :password_form => password_params } }.to change { user.reload.updated_at }
        follow_redirect!
        expect(path).to eq(user_path)
      end
    end
  end

  context "given no user" do
    describe "GET /password/new" do
      it "redirects to the home page" do
        get new_password_path
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "POST /password" do
      it "redirects to the home page" do
        post password_path
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end
  end
end


