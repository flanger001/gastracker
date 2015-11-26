class RemoveDefaultFromGasEntry < ActiveRecord::Migration
  def up
    change_column_default :gas_entries, :cost, nil
    change_column_default :gas_entries, :price_per_gallon, nil
  end

  def down
    change_column_default :gas_entries, :cost, 0
    change_column_default :gas_entries, :price_per_gallon, 0
  end
end
