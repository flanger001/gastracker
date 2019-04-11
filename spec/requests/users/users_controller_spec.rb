require "rails_helper"

RSpec.describe Users::UsersController do
  let!(:user) { create(:user) }

  context "given an authenticated user" do
    before { sign_in(user) }

    describe "POST /account" do
      let(:user_params) { { :name => "Jane Doe", :email => "bar@example.com", :password => "p@ssw0rd", :password_confirmation => "p@ssw0rd" } }

      it "redirects to the dashboard" do
        expect { post user_path, :params => { :user => user_params } }.to_not change { User.count }

        follow_redirect!
        expect(path).to eq(root_path)
        follow_redirect!
        expect(path).to eq(dashboard_path)
      end
    end

    describe "GET /account/new" do
      it "redirects to the dashboard" do
        get new_user_path
        follow_redirect!
        follow_redirect!
        expect(path).to eq(dashboard_path)
      end
    end

    describe "GET /account/edit" do
      it "returns an edit user form" do
        get edit_user_path(user)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /account" do
      it "returns the current authenticated user" do
        get user_path(user)
        expect(response).to have_http_status(:success)
      end
    end

    describe "PATCH /account" do
      let(:user_params) { { :name => "Bart Simpson" } }

      it "updates the current authenticated user" do
        expect { patch user_path(user), :params => { :user => user_params } }.to change { user.reload.name }.to("Bart Simpson")
      end
    end

    describe "DELETE /account" do
      it "deletes the user and signs them out" do
        expect { delete user_path(user) }.to change { User.count }.by(-1)

        follow_redirect!

        expect(path).to eq(root_path)
      end
    end
  end

  context "given no user" do
    describe "POST /account" do
      let(:user_params) { { :name => "Jane Doe", :email => "bar@example.com", :password => "p@ssw0rd", :password_confirmation => "p@ssw0rd" } }

      it "creates a new user" do
        expect { post user_path, :params => { :user => user_params } }.to change { User.count }.by(1)

        follow_redirect!

        expect(flash[:success]).to eq("Jane Doe, your account has been created and you are now logged in!")
        expect(path).to eq(root_path)

        follow_redirect!

        expect(path).to eq(dashboard_path)
      end
    end

    describe "GET /account/new" do
      it "returns a new user form" do
        get new_user_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /account/edit" do
      it "redirects to the home page" do
        get edit_user_path(user)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "GET /account" do
      it "redirects to the home page" do
        get user_path(user)
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "PATCH /account" do
      it "redirects to the home page" do
        expect { patch user_path(user) }.to_not change { user.reload }
        follow_redirect!
        expect(path).to eq(root_path)
      end
    end

    describe "DELETE /account" do
      it "redirects to the home page" do
        expect { delete user_path(user) }.to_not change { User.count }

        follow_redirect!

        expect(path).to eq(root_path)
      end
    end
  end
end
