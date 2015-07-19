class GasEntryPresenter < Presenter

  delegate :odometer,
           :distance,
           :gallons,
           :cost,
           :notes,
           :date,
           to: :resource

  def post_initialize(args)
    true
  end

  def vehicle
    resource.vehicle ? "#{resource.vehicle.year} #{resource.vehicle.brand} #{resource.vehicle.name}" : 'None Entered'
  end

  def pretty_date
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
