class Station < ApplicationRecord
  has_many :gas_entries
  has_many :user_stations, :dependent => :destroy
  has_many :users, :through => :user_stations
end
