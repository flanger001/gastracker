module Vehicles
  class VehiclesController < ApplicationController
    def index
      authorize(collection)
    end

    def show
      authorize(resource)
    end

    def new
      @resource = Vehicle.new
      authorize(resource)
    end

    def edit
      authorize(resource)
    end

    def create
      authorize(Vehicle)
      @resource = Vehicle.new(vehicle_params.merge(:user => current_user))
      if resource.save
        redirect_to resource, :notice => "Vehicle was successfully created."
      else
        render :action => :new
      end
    end

    def update
      authorize(resource)
      if resource.update(vehicle_params)
        redirect_to resource, :notice => "Vehicle was successfully updated."
      else
        render :action => :edit
      end
    end

    def destroy
      authorize(resource)
      resource.destroy
      redirect_to vehicles_url, :notice => "Vehicle was successfully destroyed."
    end

    private

    def collection
      @collection ||= Vehicle.includes(:user).where(:user_id => current_user.id)
    end

    def resource
      @resource ||= Vehicle.includes(:user).find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:brand, :name, :year, :photo, :remove_photo)
    end
  end
end
