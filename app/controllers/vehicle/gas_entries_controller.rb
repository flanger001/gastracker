class Vehicle::GasEntriesController < ApplicationController
  layout 'gas_entry'

  def index
  end

  def dashboard
    @resource = collection.first || GasEntry::Empty.new
  end

  def show
  end

  def new
    @resource = GasEntry.new(user: current_user, date: Date.today, vehicle: vehicle)
  end

  def create
    @resource = GasEntry.new(resource_params.merge(user: current_user, vehicle: vehicle))
    if resource.station
      resource.station.user = current_user
    end
    if resource.save
      flash[:success] = 'Fill-up added successfully!'
      redirect_to gas_entries_path
    else
      flash[:error] = 'Unable to save fill-up!'
      render :new
    end
  end

  def edit
  end

  def update
    if resource.update(resource_params)
      flash[:success] = 'Fill-up edited successfully!'
      redirect_to gas_entries_path
    else
      flash[:error] = 'Unable to edit fill-up!'
      render :edit
    end
  end

  def destroy
    resource.destroy
    flash[:success] = 'Fill-up deleted successfully!'
    redirect_to gas_entries_path
  end

  private

  def resource_params
    params.require(:gas_entry).permit(
      :date,
      :odometer,
      :gallons,
      :distance,
      :notes,
      :cost,
      :station_id,
      :vehicle_id,
      :price_per_gallon,
      :photo,
      :remove_photo,
      { :station_attributes => [:id, :name, :address, :city, :state, :zip, :phone] })
  end

  def collection
    @collection ||= GasEntry.only_this_year
  end

  def resource
    @resource ||= GasEntry.find(params[:id])
  end

  def vehicle
    @vehicle ||= Vehicle.find(params[:vehicle_id])
  end

  def stations
    @stations = Station.includes(:user).where(user: current_user)
  end

  helper_method :resource, :collection, :vehicle, :stations
end
