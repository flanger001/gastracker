class Vehicle::VehiclesController < ApplicationController
  layout 'vehicle'

  def show
  end

  def new
    @resource = Vehicle.new(user: current_user)
  end

  def edit
  end

  def create
    @resource = Vehicle.new(vehicle_params.merge(user: current_user))
    if resource.save
      redirect_to resource, notice: 'Vehicle was successfully created.'
    else
      render action: :new
    end
  end

  def update
    if resource.update(vehicle_params)
      redirect_to resource, notice: 'Vehicle was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    resource.destroy
    redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.'
  end

  def collection
    @collection ||= Vehicle.includes(:user).where(user: current_user)
  end

  def resource
    @resource ||= Vehicle.includes(:user).where(user: current_user).find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:brand, :name, :year)
  end
end
