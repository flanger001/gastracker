class GasEntryPresenter
  include ActiveSupport::NumberHelper

  attr_reader :resource, :user

  delegate :to_key,
           :to_param,
           :to_partial_path,
           :new_record?,
           :persisted?,
           :odometer,
           :distance,
           :gallons,
           :cost,
           :notes,
           to: :resource
  
  def initialize(resource, user)
    @resource = resource
    @user = user
  end

  def vehicle
    resource.vehicle ? "#{resource.vehicle.year} #{resource.vehicle.brand} #{resource.vehicle.name}" : 'None Entered'
  end

  def date
    resource.date.to_s(:long)
  end

  def mpg
    resource.mpg.round(2)
  end

  def station
    resource.station ? "#{resource.station.name} - #{resource.station.city} #{resource.station.state} " : 'None Entered'
  end

  def method_missing(m, *args, &block)
    resource.public_send(m, *args, &block)
  end

end
