class AddFieldsToStation < ActiveRecord::Migration
  def change
    change_table :stations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
    end
  end
end
