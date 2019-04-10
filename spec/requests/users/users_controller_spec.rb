require "rails_helper"

RSpec.describe Users::UsersController do
  describe "POST /users" do
    let(:user_params) { { :name => "Jane Doe", :email => "bar@example.com", :password => "p@ssw0rd", :password_confirmation => "p@ssw0rd" } }

    it "create a new user" do
      expect { post user_path, :params => { :user => user_params } }.to change { User.count }.by(1)

      assert_equal "Jane Doe, your account has been created and you are now logged in!", flash[:success]
    end
  end
end
