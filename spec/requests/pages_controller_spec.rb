require "rails_helper"

RSpec.describe PagesController do
  it "should get index" do
    get :index
    expect(response).to have_http_status(:success)
  end

end
