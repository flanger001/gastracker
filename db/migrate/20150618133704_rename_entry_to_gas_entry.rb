class RenameEntryToGasEntry < ActiveRecord::Migration
  def change
    rename_table :entries, :gas_entries
  end
end
