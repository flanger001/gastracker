module Vehicles
  class GasEntriesController < ApplicationController
    def index
      authorize(vehicle)
    end

    def show
      authorize(resource)
    end

    def new
      authorize(vehicle)
      @resource = GasEntry.new(:vehicle => vehicle)
      authorize(resource)
    end

    def create
      authorize(vehicle)
      @resource = vehicle.gas_entries.build(resource_params)
      authorize(resource)
      if resource.station
        resource.station.user = current_user
      end
      if resource.save
        flash[:success] = "Fill-up added successfully!"
        redirect_to vehicle_gas_entries_path(vehicle)
      else
        flash[:error] = "Unable to save fill-up!"
        render :new
      end
    end

    def edit
      authorize(resource)
    end

    def update
      authorize(resource)
      if resource.update(resource_params)
        flash[:success] = "Fill-up edited successfully!"
        redirect_to vehicle_gas_entries_path(vehicle)
      else
        flash[:error] = "Unable to edit fill-up!"
        render :edit
      end
    end

    def destroy
      authorize(resource)
      resource.destroy
      flash[:success] = "Fill-up deleted successfully!"
      redirect_to vehicle_gas_entries_path(vehicle)
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
      @collection ||= GasEntry.includes(:vehicle).
                        where(:vehicle => vehicle)
    end

    def resource
      @resource ||= GasEntry.find(params[:id])
    end

    def vehicle
      @vehicle ||= Vehicle.find(params[:vehicle_id])
    end

    def stations
      @stations = Station.includes(:user).where(:user => current_user)
    end

    helper_method :vehicle, :stations
  end
end
