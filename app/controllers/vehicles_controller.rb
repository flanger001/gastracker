class VehiclesController < ApplicationController
  before_action :require_user

  def index
  end

  def show
  end

  def new
    @resource = current_user.vehicles.build
  end

  def edit
  end

  def create
    @resource = current_user.vehicles.build(vehicle_params)

    if resource.save
      redirect_to resource, notice: 'Vehicle was successfully created.'
    else
      render :new
    end
  end

  def update
    if resource.update(vehicle_params)
      redirect_to resource, notice: 'Vehicle was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    resource.destroy
    redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.'
  end

  private

  def resource
    @resource ||= current_user.vehicles.find(params[:id])
  end

  def collection
    @collection ||= current_user.vehicles.all
  end

  def vehicle_params
    params.require(:vehicle).permit(:brand, :name, :year)
  end

  helper_method :collection, :resource

end
