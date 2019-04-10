require "rails_helper"

RSpec.describe Users::SessionsController do
  it "should get new" do
    get :new
    expect(response).to have_http_status(:success)
  end

end
