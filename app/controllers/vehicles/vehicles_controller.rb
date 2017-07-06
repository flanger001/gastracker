module Vehicles
  class VehiclesController < ApplicationController
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

    private

    def collection
      @collection ||= Vehicle.includes(:user).where(user_id: current_user.id)
    end

    def resource
      @resource ||= Vehicle.includes(:user).where(user_id: current_user.id).find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:brand, :name, :year, :photo, :remove_photo)
    end
  end
end
