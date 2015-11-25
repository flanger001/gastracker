class AddPricePerGallonToGasEntry < ActiveRecord::Migration
  def change
    add_column :gas_entries, :price_per_gallon, :float, default: 0
  end
end
