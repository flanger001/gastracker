class AddPhotoToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :photo, :string
  end
end
