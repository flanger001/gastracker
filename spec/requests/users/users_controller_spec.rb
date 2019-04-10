require "rails_helper"

RSpec.describe Users::UsersController do
  it "can create a new user" do
    assert_difference("User.count") do
      post :create, :user => { :name => "Jane Doe", :email => "bar@example.com", :password => "p@ssw0rd", :password_confirmation => "p@ssw0rd" }
    end
    assert_equal "Jane Doe, your account has been created and you are now logged in!", flash[:success]
  end
end
