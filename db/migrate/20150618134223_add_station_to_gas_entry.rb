class AddStationToGasEntry < ActiveRecord::Migration
  def change
    add_reference :gas_entries, :stations, index: true
  end
end
