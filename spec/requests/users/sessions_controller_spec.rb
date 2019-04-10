require "rails_helper"

RSpec.describe Users::SessionsController do
  describe "GET sessions/new"

  it "should get new" do
    get new_session_path
    expect(response).to have_http_status(:success)
  end


end
