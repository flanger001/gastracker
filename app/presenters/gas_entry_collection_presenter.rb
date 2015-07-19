class GasEntryCollectionPresenter < Presenter

  attr_reader :collection

  def post_initialize(args)
    @collection = args[:collection].map { |e| GasEntryPresenter.new({ resource: e, user: user, view: view }) }
  end

  def total_recorded_distance
    collection.map(&:distance).reduce(:+).round(2)
  end

  def total_gallons
    collection.map(&:gallons).reduce(:+).round(2)
  end

  def total_cost
    view.number_to_currency(collection.map(&:cost).reduce(:+))
  end

  def average_mpg
    (collection.map(&:mpg).reduce(:+) / collection.size).round(2)
  end

  def method_missing(m, *args, &block)
    collection.send(m, *args, &block)
  end

end
