class FixStationRef < ActiveRecord::Migration
  def change
    remove_reference :gas_entries, :stations, index: true
    add_reference :gas_entries, :station, index: true
  end
end
