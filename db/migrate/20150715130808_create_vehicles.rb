class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :year
      t.string :brand
      t.string :name
      t.references :user

      t.timestamps null: false
    end
  end
end
