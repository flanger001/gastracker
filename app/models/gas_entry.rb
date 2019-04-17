class GasEntry < ApplicationRecord
  belongs_to :station
  belongs_to :vehicle
  accepts_nested_attributes_for :station

  mount_uploader :photo, ImageUploader

  validates :gallons, :numericality => { :greater_than => 0 }, :unless => :photo?
  validates :odometer, :numericality => true, :unless => :photo?
  validates :vehicle, :presence => true

  before_save :calculate_cost_or_ppg, :unless => :photo?

  scope :most_recent, -> { order("date desc") }
  scope :this_year, -> { where("date >= ?", Time.now.at_beginning_of_year) }
  scope :for_user, ->(user) { joins(:station, :vehicle).where(:vehicles => { :user => user }) }

  def mpg
    distance / gallons
  end

  def self.total_cost
    this_year.map(&:cost).sum
  end

  def calculate_cost_or_ppg
    if self.cost
      self.price_per_gallon = cost / gallons
    elsif self.price_per_gallon
      self.cost = price_per_gallon * gallons
    end
  end

  class Empty < GasEntry; end
end

