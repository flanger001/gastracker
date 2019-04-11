class AddMissingForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :vehicles, :users
    add_foreign_key :gas_entries, :stations
    add_foreign_key :gas_entries, :vehicles
  end
end
