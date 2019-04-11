class RemoveUserFromGasEntry < ActiveRecord::Migration[5.2]
  def change
    remove_reference :gas_entries, :user
  end
end
