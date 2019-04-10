require "rails_helper"

RSpec.describe StationsController do
  setup do
    @station = stations(:one)
  end

  it "should get index" do
    get :index
    expect(response).to have_http_status(:success)
    assert_not_nil assigns(:stations)
  end

  it "should get new" do
    get :new
    expect(response).to have_http_status(:success)
  end

  it "should create station" do
    assert_difference("Station.count") do
      post :create, :station => {}
    end

    assert_redirected_to station_path(assigns(:station))
  end

  it "should show station" do
    get :show, :id => @station
    expect(response).to have_http_status(:success)
  end

  it "should get edit" do
    get :edit, :id => @station
    expect(response).to have_http_status(:success)
  end

  it "should update station" do
    patch :update, :id => @station, :station => {}
    assert_redirected_to station_path(assigns(:station))
  end

  it "should destroy station" do
    assert_difference("Station.count", -1) do
      delete :destroy, :id => @station
    end

    assert_redirected_to stations_path
  end
end
