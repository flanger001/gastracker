# frozen_string_literal: true

module Vehicles
  class VehiclesController < ApplicationController
    def index
      authorize(collection)
    end

    def show
      authorize(resource)
      @last_gas_entries = resource.gas_entries.last(5)
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
        flash[:success] = "Vehicle was successfully created."
        redirect_to resource
      else
        render :action => :new
      end
    end

    def update
      authorize(resource)
      if resource.update(vehicle_params)
        flash[:success] = "Vehicle was successfully updated."
        redirect_to resource
      else
        render :action => :edit
      end
    end

    def destroy
      authorize(resource)
      resource.destroy
      flash[:success] = "Vehicle was successfully destroyed."
      redirect_to vehicles_path
    end

    private

    def collection
      @collection ||= Vehicle.includes(:user).where(:user_id => current_user.id)
    end

    def resource
      @resource ||= Vehicle.preload(:gas_entries).includes(:user).find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:brand, :name, :year, :photo, :remove_photo)
    end
  end
end
