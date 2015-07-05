class AddCostToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :cost, :float8
  end
end
