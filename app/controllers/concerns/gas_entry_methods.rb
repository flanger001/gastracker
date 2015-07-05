module GasEntryMethods

  def self.included(base)
    base.class_eval do
      helper_method :total_recorded_distance, :total_gallons, :total_cost, :average_mpg
    end
  end

  def total_recorded_distance
    collection.map(&:distance).reduce(:+)
  end

  def total_gallons
    collection.map(&:gallons).reduce(:+)
  end

  def total_cost
    number_to_currency(collection.map(&:cost).reduce(:+))
  end

  def average_mpg
    collection.map(&:mpg).reduce(:+) / collection.size
  end

end
