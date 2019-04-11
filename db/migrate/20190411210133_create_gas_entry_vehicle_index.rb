class CreateGasEntryVehicleIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :gas_entries, :vehicle_id
  end
end
