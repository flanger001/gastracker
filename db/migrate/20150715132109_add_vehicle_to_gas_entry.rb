class AddVehicleToGasEntry < ActiveRecord::Migration
  def change
    add_reference :gas_entries, :vehicle
  end
end
