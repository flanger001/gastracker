class Statistics
  attr_reader :vehicle, :gas_entries
  delegate :empty?, to: :gas_entries
  def initialize(vehicle)
    @vehicle = vehicle
    @gas_entries = vehicle.gas_entries.only_this_year
  end

  def total_recorded_distance

  end

  def total_gallons

  end

  def total_cost

  end

  def average_mpg

  end
end
