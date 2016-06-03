class Vehicle::StatisticsController < ApplicationController
  private

  def resource
    @resource ||= Statistics.new(Vehicle.find(params[:id]))
  end
end
