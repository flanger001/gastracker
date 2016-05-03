class AddPhotoToGasEntry < ActiveRecord::Migration
  def change
    add_column :gas_entries, :photo, :string
  end
end
