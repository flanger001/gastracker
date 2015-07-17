# == Schema Information
#
# Table name: gas_entries
#
#  id         :integer          not null, primary key
#  odometer   :integer          default(0)
#  gallons    :float            default(0.0)
#  distance   :float            default(0.0)
#  created_at :datetime
#  updated_at :datetime
#  date       :date
#  notes      :string(255)
#  cost       :float            default(0.0)
#  user_id    :integer
#  station_id :integer
#  vehicle_id :integer
#

class GasEntry < ActiveRecord::Base

  belongs_to :user
  belongs_to :station
  belongs_to :vehicle
  accepts_nested_attributes_for :station

  validates :gallons, numericality: { greater_than: 0 }
  validates :odometer, numericality: true

  scope :most_recent, -> { order('date desc') }
  scope :this_year, -> { where('date >= ?', Time.now.at_beginning_of_year) }

  def mpg
    distance / gallons
  end

  def self.total_cost
    this_year.map(&:cost).sum
  end

end
