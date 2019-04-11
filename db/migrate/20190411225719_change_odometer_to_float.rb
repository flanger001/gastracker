class ChangeOdometerToFloat < ActiveRecord::Migration[5.2]
  def up
    change_column :gas_entries, :odometer, :float, default: 0.0
  end

  def down
    change_column :gas_entries, :odometer, :integer, default: 0
  end
end
