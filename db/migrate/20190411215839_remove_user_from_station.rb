class RemoveUserFromStation < ActiveRecord::Migration[5.2]
  def change
    remove_reference :stations, :user
  end
end
