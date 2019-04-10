require "rails_helper"

RSpec.describe Vehicles::VehiclesController do
  setup do
    @vehicle = vehicles(:one)
  end

  it "should get index" do
    get :index
    expect(response).to have_http_status(:success)
    assert_not_nil assigns(:vehicles)
  end

  it "should get new" do
    get :new
    expect(response).to have_http_status(:success)
  end

  it "should create vehicle" do
    assert_difference("Vehicle.count") do
      post :create, :vehicle => { :make => @vehicle.brand, :model => @vehicle.name, :year => @vehicle.year }
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  it "should show vehicle" do
    get :show, :id => @vehicle
    expect(response).to have_http_status(:success)
  end

  it "should get edit" do
    get :edit, :id => @vehicle
    expect(response).to have_http_status(:success)
  end

  it "should update vehicle" do
    patch :update, :id => @vehicle, :vehicle => { :make => @vehicle.make, :model => @vehicle.model, :year => @vehicle.year }
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  it "should destroy vehicle" do
    assert_difference("Vehicle.count", -1) do
      delete :destroy, :id => @vehicle
    end

    assert_redirected_to vehicles_path
  end
end
