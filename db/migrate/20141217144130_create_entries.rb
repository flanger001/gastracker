class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :odometer
      t.float :gallons
      t.float :distance

      t.timestamps
    end
  end
end
