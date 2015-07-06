class AddStationRefToUser < ActiveRecord::Migration
  def change
    add_reference :stations, :user
  end
end
